# Initial Component code snippet and use

# Code Structure

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

Component Structure | <ComponentName> //always in 2 word

├── 1.0.0/  
├── <ComponentName>.component.xml  
│ ├── src/  
│ ├── html/  
│ ├── preview.html  
│ └── weBeans/  
│ └── ComponentName.weBean.html  
│ ├── js/  
│ └── ComponentName.class.js  
│ └── less/  
│ └── DefaultComponentName.html  
│ ├── test/  
│ ├── html/  
│ └── ComponentName.html  
│ └── js/  
│ └── ComponentName.mochaTest.js  
│ └── doc/  
│ └── component-document-file.doc

# File Snippet

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

1.0.0/src/html/preview.html

```
<!DOCTYPE html>
<html onload="" lang="en">

<head>
  <title>shift</title>
  <meta charset="utf-8" />
  <meta id="viewport" name="viewport" content="width=device-width, initial-scale=1.0" />
  
  <!-- Use your component XML path to use. -->
  <link href="/EAMD.ucp/Components/com/pankaj/CardItem/1.0.0/CardItem.component.xml" rel="ucpComponent" type="text/html" />

  <script src="/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/1.0.0/src/js/Once.class.js" type="text/javascript"></script>
  <script>
    class App {
      static get implements() {
        return [];
      }
      static start() {
        var App = CardItem.getInstance(); // Use our component name here
        App.init();
        App.defaultView.append();
        ONCE.global.App = App;
      }
      static init() {
        console.debug("start loading App components...");
        return "start loading App components...";
      }

      discover() {
        return this.models;
      }
    }
  </script>

  <style type="text/css">
    .loading {
      display: none;
    }

    .loading:only-child {
      display: flex;
      height: 100%;
      align-items: center;
      justify-content: center;
    }

    .loading img {
      max-width: 200px;
      max-height: 200px;
    }
  </style>
</head>

<body>
  <div class="loading">
    <img class="loading" src="/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/2.0.0-ONE/src/assets/loading.svg" />
  </div>
</body>

</html>
```

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

1.0.0/src/html/weBeans/ComponentName.weBean.html

```
<!-- 'id' should be your <ComponentName> and 'is' should be two word with hyphen must. -->
<template id="CardItem" is="card-item">
    <div class="carditem">
        Card Item
    </div>
</template>
```

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

1.0.0/src/js/ComponentName.class.js

```
// Component Class
var CardItem = Namespace.declare("tla.EAM.layer3",
    class CardItem extends Interface { }
);

// Component UCP Class
var DefaultCardItem = Namespace.declare("tla.EAM.layer2",
    class DefaultCardItem extends UcpComponent {
        static get implements() { return [CardItem]; }
        static get overwriteServerDescriptor() { return true; }
        static get dependencies() { return []; }
        static get weBeanUnitPaths() { return [ "src/html/weBeans/CardItem.weBean.html", ]; }
        static start() {
          UcpComponentSupport.importLink(
            this.IOR.basePath + "/src/less/" + this.name + ".less",
            "stylesheet/less",
            "text/css"
          );
        }
        
        constructor() { super(); }

        init() {
            super.init();
            const model = {
                itemViewModel: {
                    name: this.constructor.name,
                    description: "componentName implementaion of a ucpComponent",
                    badge: "componentName"
                },
            };
            this.model = model;
            this.model.autoUpdate = true;

            Thinglish.defineAlias(this.model, "itemViewModel.name");
            Thinglish.defineAlias(this.model, "itemViewModel.description");
            Thinglish.defineAlias(this.model, "itemViewModel.badge");

            this.actionIndex = Thinglish.createActionIndexOf(CardItem, this);
            return this;
        }

        onDomReady(view) { }

        updateView(view, updateObject) {
            if (!updateObject) { return; }
            Object.keys(updateObject).forEach(
                member => {
                    switch (member) {
                        case "property1":
                            //update something for property1
                            break;
                        default:
                        //update something in any case
                    }
                }
            );
        }
    }
);
```

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

1.0.0/src/less/DefaultComponentName.less

```
@import "@{schema}"; //getting less variable, breakpionts and mixin

.carditem {}

@media only screen and (min-width: @md) {
}
```

# Model/Data, usage in woda

**Data** is use for getting *value* in html. **Data,** trigger html rerender when *value* change.

In the HTML we can get *value* by:

```
$-{this.data.<attribute>}
```

In JS we use <attribute> in INIT:

```
init() {
  const model = {
  itemViewModel: {}, // contain component details e.g. name, description, badge
  attribute: "value", //
  };
}
```

# Standard Use Case

Always use the “model” attribute in the HTML file to get data and auto-update in WODA

```
<div $-{this.model.name}> // model is important to update value in woda.
    Card Item
</div>
```

Whenever “model” changes in the code HTML re-render and show updated value.

> [!NOTE]
> model change won’t work in “defaultView” for that we need to use “super.update()” function in the update() method.

# WebBean Rendering Version 1.0.0

WeBeans, Woda lifecycle, and method list: <[LINK](./2cu.atlassian.net/wiki/spaces/CCU/pages/486866962/WebBean_Rendering_Version_1.0.0.md)\>

# An important and must method to use in WeBean

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

static get dependencies()

Use this method to call the other “Component“ as other dependencies to use in your created component.

the example below:-

```
static get dependencies() {
  return [
  //    "/EAMD.ucp/Components/com/twitter/Bootstrap/Accordion/CollapsiblePanel/4.0.0/CollapsiblePanel.component.xml",
  ];
}
```

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

static get weBeanUnitPaths()

Use this method to use your custom weBean or multiple weBeans with the functional use.

the example below:-

```
static get weBeanUnitPaths() {
    return [
        "src/html/weBeans/IdealComponent.weBean.html",
        "src/html/weBeans/IdealComponentMinimalItemView.weBean.html",
        "src/html/weBeans/IdealComponentMinimalDetailsView.weBean.html"
    ];
}
```

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

static start()

Use this method to run your code in the start of component

the example below:-

```
static start() {
    // Example: run less compiler to use less file for component
    UcpComponentSupport.importLink(
        this.IOR.basePath + "/src/less/" + this.name + ".less",
        "stylesheet/less",
        "text/css"
    );
}
```

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

constructor()

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

init()

Use this method to describe info about the component (i.e name, description, badge) and to define your initial <model.value> and function before render.

the example below:-

```
init() {
    super.init();

    const model = {
        itemViewModel: {
            name: this.constructor.name,
            description: "ideal minimal implementaion of a ucpComponent",
            badge: "ideal" //"has to be copied on UcpView.init"
        },

        attribute1: "anAttribute",
        relationship1: EmptyRelationship.of(User),
        collection1: [1, 2, 3, 4, 5],
        subComponent: undefined
    };
    this.model = model;
    this.model.autoUpdate = true;

    Thinglish.defineAlias(this.model, "itemViewModel.name");
    Thinglish.defineAlias(this.model, "itemViewModel.description");
    Thinglish.defineAlias(this.model, "itemViewModel.badge");
    
    this.actionIndex = Thinglish.createActionIndexOf(IdealComponent, this);
    return this;
}
```

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

onDomReady(view)

Use this method to run your code/function after rendering the weBean in the DOM.

the example below:-

```
onDomReady(view) {
  // your functionality here
}
```

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

updateView(view, updateObject)

Use this method to run your functionality depend on <modal.value> changes.

> [!NOTE]
> updateView(), is a special method in Woda and, updateView() works differently in every class (ucpComponent, defaultView, ucpView) of Woda.

the example below:-

```
updateView(view, updateObject) {
  if (!updateObject) { updateObject = this.ucpModel.updateObject; }
  if (!updateObject) { return; }
  
  Object.keys(updateObject).forEach(
    member => {
      switch (member) {
        case "<model name>":
          // your function()
          break;
        default:
        // update something in any case or,
        // super.update();
      }
    }
  );
}
```

# Another useful way to create a Custom Component method

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

Custome View with custome webean

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

Get element by ID

html  
`<div element-id="$-{this.viewId}_leafletMap"></div>`  
  
JS  
`let element = await this.lookupElementId("leafletMap");`

# Other useful function/method for better code writing

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

Enumeration

Using enumeration in the code makes your code more readable and good as per the best practicese.

In Woda, we have a special method called “`Enum.declareEnumConstants`“ it's very helpful to combine ‘enumeration’ with ‘event handling'.

> [!NOTE]
> You can run the ‘enumeration’ code in Start() method.

enum declare example:-

```
Enum.declareEnumConstants(UserPanel, "EVENT_", {
  login: "UserPanel.login",
  logout: "UserPanel.logout",
  setting: "UserPanel.setting",
});
```

use enum example (with event handle):-

```
this.eventSupport.fire(UserPanel.EVENT_LOGIN, this);
```

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

Event handling in between component

In Woda, we have a method called `'eventSupport'` that helps us to fire/listen to events with the component.

To use `‘eventSupport’`, Its use as FIRE and LISTENER.  
  
For example:-  
Fire from the “DropDown“ component

```
this.eventSupport.fire(DropDown.EVENT_TOGGLE, this);
```

LIstening to “ShiftNetwork“ component

```
this.userDropDown = DropDown.getInstance().init();
// listening and binding with custome method.
this.userDropDown.eventSupport.addEventListener(DropDown.EVENT_TOGGLE, this, this.onDropdownToggle.bind(this));

onDropdownToggle(){
  // do something what you want
}
```

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

PluginContainer use, with re-render case handling

“PluginContainer”, is a special component in WODA to load multiple inner component in your primary component.  
  
For example, in weBean:-

```
<plugin-container name="Link" accepted-type="Any" webean-property="pluginName"></plugin-container>
```

‘name’ as word say its define your component.  
'accepted-type' if Any, it can load any component. And you can define conditional like, Nav, Menu etc.  
'webean-property' value is use as a property name in js code.  
  
For example, in JS:-

```
// defien get/set for pluginContainer
get pluginContent() {
  return this._private.pluginComp;
}
set pluginContent(newValue) {
  this._private.pluginComp = newValue;
  this.defaultView.pluginName.clear();
  this.defaultView.pluginName.add(this._private.pluginComp);
}

//onDomReady, set default component before adding any new.
if (!this.pluginContent) {
  let pluginView = this.controller.getCustomView(DefaultPlugin, this);
  this.pluginContent = pluginView;
}

//DefautlView - onDomReady
onDomReady(view) {
  if (!this.ucpComponent.pluginContent) { }
  else {
    this.updateChildren(); // re-render issue fix with updatechildren()
    this.pluginName.add(this.ucpComponent._private.pluginComp);
  }
}
```