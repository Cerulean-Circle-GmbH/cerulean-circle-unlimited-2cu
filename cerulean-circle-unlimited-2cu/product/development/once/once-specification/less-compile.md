[📁 Once Specification](../once-specification.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/400000082/less-compile.md) | [🌐 Page Structure local SymLink](./less-compile.page.md)

# Less compile

# Less Compile problem

The problem is caused by starting the Compile in Once / UcpComponentSupport and set the Theam in the App class in the start method. This my not be early enough and the compile is already through.

The quick solution is to block the compile from Once and UcpComponentSupport and start it only in the start method of the App. This is triggered by the getter ownLessHander who returns true.

UcpComponentSupport.class.js

```
 init(aDocument) {
      if (!aDocument) {
        aDocument = document;
      }
      logger.log({
        level: "info",
        category: "BOOTING"
      }, "UcpComponents ready");
      this.weBeanRegistry = WebBeans2.getInstance();
      document.body.innerHTML = this.weBeanRegistry.convertWebComponentsToDivs();

      this.ucpComponentIORs = this.findUcpComponentLinks(aDocument);
      Thinglish.loadAndStartAll(Once, this.ucpComponentIORs).then(() => {
        this.importLink(this.type.class.IOR.basePath + "/src/css/UcpComponentSupport.css", "stylesheet", "text/css");
        //this.importLink("/EAMD.ucp/Components/com/twitter/Bootstrap/3.3.7/dist/css/custom/bootstrap.cerulean.min.css", "stylesheet", "text/css");
        UcpView.start();
        logger.log({
          level: "user",
          category: "BOOTING"
        }, "loading application components");
        let appDependencies = this.applicationComponents();
        if (App.dependencies)
          appDependencies = this.applicationComponents().concat(App.dependencies);

        Thinglish.loadAndStartAll(Once, appDependencies).then(() => {
          this.updateChildren(document.body);
          if (ONCE.global.LessSingleton) {
            if (typeof App !== "undefined" && App && App.ownLessHandler) {
            // App handle there own Less compile
            } else {
              LessSingleton.data.compile = true;
              LessSingleton.compile();
            }
          }
          ONCE.state = "running";
          logger.log({
            level: "user",
            category: "BOOTING"
          }, "everyThing loaded and ready to speak...");
          Workflow.defaultInstance.init();
          try {
            let app = App.start();
            ONCE.Store.register(App, app);
            ONCE.Store.register(UcpComponentSupport, ONCE.global.UcpComponentSupport);

          } catch (e) {
            // @TODO Please fix
            //Action.do(DetailsView.ACTION_SHOW, e);
            console.error(e);
            Action.do(DetailsView.ACTION_SHOW, e);
          }
        });
      });
      return this;
    }
```

Once.class.js

```
async loadDescriptor(descriptorUrl) {
                    let aClass = ONCE.lookupClass4Descriptor(descriptorUrl);
                    if (aClass) {
                        return aClass;
                    }

                    const ior = new IOR().init(descriptorUrl);

                    aClass = await ONCE.start(ior);
                    if (!aClass) {
                        return;
                    }
                    console.debug("loaded ", aClass.type.name);
                    //this.current.class = aClass;
                    //this.maintainOptions(this.current);
                    ONCE.state = "running";
                    console.log("set ONCE.state", ONCE.state);

                    if (window.LessSingleton) {
                        if (typeof App !== "undefined" && App && App.ownLessHandler) {
                            // App handle there own Less compile
                        } else {
                            LessSingleton.data.compile = true;
                            LessSingleton.compile();
                        } 
                    }

                    if (aClass.demo) {
                        aClass.demo();
                    }
                    return aClass;
                }
```

ShifterNetwork.html

```
   class App {
            static get implements() {
                return [];
            };
            static async start() {
                var app = ShifterNetwork.getInstance();
                app.init();

                LessSingleton.model.currentTheme = ShiftTheme.getInstance().init();
                LessSingleton.data.compile = true;
                await LessSingleton.compileNow();

                app.defaultView.append();
                window.shiftPortal = app;
                App.instance = app;
                
                ONCE.global.App = app;
            }

            static get ownLessHandler() { return true }

```
