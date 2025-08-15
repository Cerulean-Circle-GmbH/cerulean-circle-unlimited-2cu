# The Concept of App

- [What is an App](#what-is-an-app)
  - [App Declaration](#app-declaration)
  - [App registering](#app-registering)
  - [App lookup](#app-lookup)
  - [App Actions](#app-actions)
    - [Sign In Workflow: WORKFLOW\_DEFAULT\_SIGN\_IN](#sign-in-workflow-workflow_default_sign_in)

# What is an App

An App is a UcpComponent with with a loading page.

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

The loading page is usually located in one of the following locations:

```
/EAMD.ucp/apps/.../App.html { as a symbolic link to either:

  /EAMD.ucp/Components/your/domain/Component/1.0.0/dist/Component.html
  /EAMD.ucp/Components/your/domain/Component/1.0.0/src/html/Component.html
}
```

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

This in done for the following examples:

- [Test Server Apps](https://test.wo-da.de/EAMD.ucp/apps)
  - [https://test.wo-da.de/EAMD.ucp/Components/com/ceruleanCircle/EAM/5\_ux/WODA/2.3.2/src/html/WODA.html](https://test.wo-da.de/EAMD.ucp/Components/com/ceruleanCircle/EAM/5_ux/WODA/2.3.2/src/html/WODA.html)
  - [https://test.wo-da.de/EAMD.ucp/Components/com/neom/udxd/CityManagement/1.0.0/src/html/CityManagement.html](https://test.wo-da.de/EAMD.ucp/Components/com/neom/udxd/CityManagement/1.0.0/src/html/CityManagement.html)
- [Prod Server Apps](https://prod.wo-da.de/EAMD.ucp/apps)
  - [https://prod.wo-da.de/EAMD.ucp/Components/com/ceruleanCircle/EAM/5\_ux/WODA/2.3.2/src/html/WODA.html](https://prod.wo-da.de/EAMD.ucp/Components/com/ceruleanCircle/EAM/5_ux/WODA/2.3.2/src/html/WODA.html)
  - [https://prod.wo-da.de/EAMD.ucp/apps/sfsre/sfsre.html](https://prod.wo-da.de/EAMD.ucp/apps/sfsre/sfsre.html) FondManager
    - User: license pw:123
    - User: investor pw:123
  - [https://prod.wo-da.de/EAMD.ucp/apps/shift/ShifterNetwork.html](https://prod.wo-da.de/EAMD.ucp/apps/shift/ShifterNetwork.html)

## App Declaration

The `App` is declared in `Component.html`

```
<script>
    class App {

      static async start() {
        var App = CityManagement.getInstance();
        // set the theme for neom
        LessSingleton.model.currentTheme = LessSingleton.model.currentTheme.getNeomTheme()
        await LessSingleton.compileNow();
        App.init();

        //renders the app
        App.defaultView.append();

        ONCE.global.App = App;
        ONCE.global.TheLastApp = App
        ONCE.register("WODA",App);
        
        return App;
      }
    }
    /* The App is started by
     * UcpComponentSupport v2.3.2
     * 161: try {
     *         let app = App.start();
     *         ONCE.Store.register(App, app);
     *         ONCE.Store.register(UcpComponentSupport, ONCE.global.UcpComponentSupport);
     *      }
     */
  </script>
```

## App registering

## App lookup

## App Actions

### Sign In Workflow: `WORKFLOW_DEFAULT_SIGN_IN`

```
let app = ONCE.lookup(App);
Action.do(app.type.class.WORKFLOW_DEFAULT_SIGN_IN,Action.theWorkflow.user);

// declared in ActionPanel v1.0.0 onDomReadyView line 97: 
Action.do(ActionsPanel.ACTION_SET_PRIMARY, Action.theWorkflow.user.actionIndex.ACTION_SIGN_IN);

used in 
RESTClient 2.3.2 async load(ior) { line:869
```