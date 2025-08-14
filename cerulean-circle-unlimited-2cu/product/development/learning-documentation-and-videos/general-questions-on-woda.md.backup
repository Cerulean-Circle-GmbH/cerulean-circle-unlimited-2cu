# General Questions on WODA

1. How to create a component from zero?
  1. cloning the IdealComponent
  2. use WODA in the docker image and use
    1. eamd create component …
    2. sh - [EAMD Scripts](../../development/once/once-documentation/eamd-scripts.md) / [OOSH](https://2cu.atlassian.net/wiki/spaces/CCU/pages/269156359/OOSH) sh
2. What is the lifecycle of a component?
  1. [Web 4.0](../../development/coast/web-40.md)
  2. do more
3. How scoping of css classes work?
  1. currently there is no scoping
    1. but we have Less Support
      1. [http://wo-da.de/RAW/2cuDevVideos/200604\_16:40\_Sprint-3\_Less\_Themes.mp4](http://wo-da.de/RAW/2cuDevVideos/200604_16:40_Sprint-3_Less_Themes.mp4)
  2. only when we migrate to WebComponents in Once 4.0
4. How events are propagated to parent component?
  1. [http://wo-da.de/RAW/2cuDevVideos/200710\_10:33\_Sprint-5\_Events.mp4](http://wo-da.de/RAW/2cuDevVideos/200710_10:33_Sprint-5_Events.mp4)
5. Is there a concept of slots?
  1. ```
<template  is id   >
   <div   >
    ${this.content}
    
    <div weBean-role"container">
  </div>
```
  2. /EAMD.ucp/Components/tla/EAM/layer5/PluginContainer/1.0.0/PluginContainer.component.xml
6. Can a component be conditionally loaded?
  1. of course
    1. to do  
create an IOR by new
```
let iot = IOR().init(“/EAMD.ucp/Components/tla/EAM/layer5/PluginContainer/1.0.0/PluginContainer.component.xml")
let componentClass = await ior.load();
```
7. Explain testing of component?
  1. good point
  2. mimimal creation of mocha chai tests
  3. ComponentTestBed
    1. /Users/Shared/dev/EAMD.ucp/Components/tla/EAMD/ComponentTestBed/1.0.0/ComponentTestBed.component.xml
8. How to use these components in another VUE/React/Angular project?
  1. add `<script src="/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/2.0.0-ONE/src/js/Once.class.js" type="text/javascript"></script>`
  2. lets invest more in this
  3. WODA and UCP is a paradigm shift
    1. let's wirte THE LAST ARCHITECTURE reference implementation
9. What are the advantages of WODA components over web components?
  1. NONE on GUI and Web components … they are ahead of us
  2. UCP, loader, typing, dynamic, messaging, events, P2P, runtimeRegistry, Thing
10. How WODA can be advantageous for PWA?
  1. ONCE4.0.0 is ment to become a standard PWA
  2. serviceManger ---> Loader
    1. caching , offline, inter wab page communication
11. How inter-dependencies are working?
  1. ```
var DefaultFloatComponent = Namespace.declare(
  "tla.EAM.layer2",
  class DefaultFloatComponent extends UcpComponent {
    static get implements() {
      return [FloatComponent,DropDownComponentListener];
    }
    static get overwriteServerDescriptor() {
      return true;
    }
    static get dependencies() {
      return [
        "/EAMD.ucp/Components/org/lesscss/Less/3.8.1/Less.component.xml",
        "/EAMD.ucp/Components/com/pankaj/DropDownComponent/1.0.0/DropDownComponent.component.xml"
      ];
    }
```
12. How Communications between components happening?
  1. [http://wo-da.de/RAW/2cuDevVideos/200710\_10:33\_Sprint-5\_Events.mp4](http://wo-da.de/RAW/2cuDevVideos/200710_10:33_Sprint-5_Events.mp4)
  2. [http://wo-da.de/RAW/2cuDevVideos/200709\_11:29\_Sprint-5\_RESTClient-1.mp4](http://wo-da.de/RAW/2cuDevVideos/200709_11:29_Sprint-5_RESTClient-1.mp4)
13. Is there any CLI to create default component and add its dependencies?
  1. WODA
  2. eamd
  3. currently both are broken due to the location migration and we have to fix them
14. Explain component rendering mechanism? Does it have concept of partial and virtual rendering?
  1. lazy rendering
    1. rendering diffs for WebComponents
  2. component structure based on parent and children attributes
    1. has to be tested an validated
  3. to be migrated to web components that also implies radical simplification
  4. understand it by debugging one cycle with full logging enabled
    1. RENDERING
      1. states
      2. prevents intermediate rendering on state change during subcomponent initialisation
15. Do we have also support one way binding for javascript properties?
  1. yes
  2. ```
    In a View
    =========
    
    onDomReady() {
      console.info(
        "ApplicationFrameDefaultView onDomReady",
        this.id,
        ...arguments
      );
      console.info(
        "ApplicationFrameDefaultView onDomReady - view:",
        this.id,
        this.documentElement
      );
      console.info(`
           the view is fully rendered and available in the DOM.
           initalize any DOM listeners here.
           the method will be called after every new rendering
           `);
      this.draggable();
    }
    
    update(updateObject) {
      console.info("ucpView update", this.id, ...arguments);
      if (!updateObject) {
        updateObject = this.ucpModel.updateObject;
      }
      if (!updateObject) {
        return;
      }
      Object.keys(updateObject).forEach((member) => {
        switch (member) {
          case "default_xPos":
            //console.log("updated ",member, updateObject[member]); //updateObject["default_xPos"]  == updateObject.default_xPos
            this.documentElement.style.transform = "translate3d(" + updateObject[member] + "px, " + this.model.default_yPos + "px, 0)";
          case "default_yPos":
            //console.log("updated ",member, updateObject[member]); //updateObject["default_xPos"]  == updateObject.default_xPos
            this.documentElement.style.transform = "translate3d(" + this.model.default_xPos + "px, " + updateObject[member] + "px, 0)";
            // this.updatePos();
            break;
          default:
            super.update();
        }
      });
      return true;
    }
```
16. Once we Drag and drop any component and then change its attributes & properties - how can we store the state of the component ?
  1. the Store handles the Persistence Manager and the related object that cares for storing and loading persisted state
    1. Browser DB
  2. do a dedicated session about this
17. Explain the process behind what happen, once a component is dropped in WODA IDE.
  1. in Once the method onDrop() handels all the process
    1. was a functional thinker
      1. tooooo many if then
      2. make it as done with the loader.canLoad method
  2. Thinglish.loadAndStart(ior).then().then()…
    1. nasty long method with Promises which we have to migrate to await/asyc
18. Did we run any performance test?
  1. NO but obviously we need to
  2. renderer is plain vanilla javascript
19. Is the underline idea also applicable on server side?
  1. obviously now
20. Can a component code affect other component or UI element on the page? Are they work in isolated environment? Can one component modify other component UI element directly, if yes how do we make sure that no other component can affect the feature of specific components?
  1. yes it can, but it should not… since it is ment to be broken then