[📁 Once Specification GitHub](/cerulean-circle-unlimited-2cu/product/development/once/once-specification.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/once/once-specification/thinglish-type-system.entry.md) | [🌐 Index Structure local SymLink](./thinglish-type-system.entry.entry.md)

# Thinglish Type System

in Version \[2.0.0\] - \[3.latest\] as mapped to JavaScript

- [Namespaces \[Object\]](#namespaces-object)
  - [Namespace \[Class\]](#namespace-class)
    - [declare \[Method\]](#declare-method)
      - [Parameter: declare(namespaceString, aClassDeclaration)](#parameter-declarenamespacestring-aclassdeclaration)
      - [Returns: Class instance](#returns-class-instance)
    - [init \[Method\]](#init-method)
      - [Parameter: init(nameString)](#parameter-initnamestring)
      - [Returns: Namespace instance](#returns-namespace-instance)
    - [name \[Attribute\]](#name-attribute)
    - [package \[Attribute\]](#package-attribute)
    - [namespace \[Attribute\]](#namespace-attribute)
- [Class](#class)
  - [Features](#features)
    - [Traits](#traits)
  - [Augmentation process](#augmentation-process)
    - [Attributes](#attributes)
    - [Properties](#properties)
    - [Behaviour \[Methods\]](#behaviour-methods)
  - [Semantical extensions to ES6](#semantical-extensions-to-es6)
    - [Properties](#properties)
- [TypeDescriptor](#typedescriptor)
  - [Declaration JSON](#declaration-json)
  - [name \[Attribute\]](#name-attribute)
  - [class \[Attribute\]](#class-attribute)
  - [originalClass \[Attribute\]](#originalclass-attribute)
  - [extends \[Attribute\]](#extends-attribute)
  - [implements \[Attribute\]](#implements-attribute)
  - [interfaces \[Property\]](#interfaces-property)
  - [version \[Property\]](#version-property)
    - [init \[Method\]](#init-method)
      - [Parameter: init(object)](#parameter-initobject)
      - [Returns: TypeDescriptor instance](#returns-typedescriptor-instance)

# Namespaces \[Object\]

`Namespaces` is the root (object) for all `Namespace` instances. Imagine it as *an initial empty JS object* `{}`, that adds an attribute for each `Namespace` name.

Actually it is not *an initial empty JS object* `{}`, but a Namespace instance itself with the name `"Namespaces"`

## Namespace \[Class\]

### declare \[Method\]

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

signatur

#### Parameter: declare(`namespaceString, aClassDeclaration`)

- `namespaceString` should be a string and basically represents the package of the Namespace for the Class
- `aClassDeclaration` is a declaration of a [Class](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Type_System.md+as+mapped+to+JavaScript#Class)

#### Returns: `Class` instance

```
Namespace.declare("tla.EAM.layer1", class ONCE {...} );
//                 namespaceString, aClassDeclaration
```

A Namespace is a “." seperated list of Namespace instances. In `"tla.EAM.layer1"` the first Namespace is `tla` and will be added to `Namespaces`.`tla` resulting in

```
{ 
  tla: [Namespace object]    // with { "name": "tla" } 
}
```

Above we ignored the attribute `name: "Namespaces"`, which is actually existing because `Namespaces` is an instance of `Namespace` as well.  
The pattern will be repeated on the `"tla"` object for `"EAM.layer1"` resulting in

```
{ 
  name: "Namespaces",
  "tla": { 
          "name": "tla",
          "EAM": [Namespace object]    // with { "name": "EAM", ... and so on }
       } 
}
```

> [!INFO]
> This [declaration Method](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Thinglish_Type_System.md) is one of the most fundamental methods to the Once Kernel, since it is the only way to introduce new Types to the Environment. The declared Class will be initialized with the Thinglish Type System, which contains the [Augmentation process](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Thinglish_Type_System.md) of the Class with the [TypeDescriptor](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Thinglish_Type_System.md) and it’s inherited [Traits](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Thinglish_Type_System.md) or [Features](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Thinglish_Type_System.md).

### init \[Method\]

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

signatur

#### Parameter: init(`nameString`)

- nameString should be a string

#### Returns: `Namespace` instance

```
Namespaces: Namespaces || new Namespace().init('Namespaces');
```

The above code creates a `Namespace` instance with `name: "Namespaces"`. It is the Root Namespace to all other Namespaces.

### name \[Attribute\]

```
CONSOLE

Example Case: Namespace
> Namespaces.tla.EAM.name
< "EAM" 
```

### package \[Attribute\]

package is the ".” separated list of `Namespace` `name`s that points to the Namespace where the class of `aClassDeclaration` is finally stored.  
In other words, the package of a Class is the full qualified name of a Class.  
While the package of a `Namespace` is the full qualified name of the parent `Namespace`.

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

example

```
CONSOLE

Example Case: Class
> TypeDescriptor.package
< "tla.EAM.layer1.ThinglishHelper.TypeDescriptor" 

Example Case: Namespace
> Namespaces.tla.EAM.package
< "tla.EAM"

```

### namespace \[Attribute\]

The `namespace` of a `Namespace` is the parent `Namespace`.

parent `Namespace`.

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

example

```
CONSOLE

> Namespaces.tla.EAM.namespace
< Namespace { name: "tla", ...} 

```

# Class

A Class is an ES6 instance of a Class.  
With Once, a Class has to be declared with `Namespace.declare(namespaceString, aClassDeclaration);` so that a Class is not in the first place declared in the global context of Javascript.

A class can have the following

## Features

Features are the [traits](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Thinglish_Type_System.md) that make a class unique.

- name
- package
- version
- super class
- interfaces
- enumerations
  - EVENTS
  - ACTIONS
- attributes
- properties
  - getter
  - seter
- methods (or behaviours)

### Traits

If you come from Smalltalk maybe you are used to this term then to the term [Features](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Thinglish_Type_System.md).

## Augmentation process

Classes will be enhanced during declaration with

`{`

### Attributes

Classes will be injected additional `attributes` during declaration:

- `type`: [TypeDescriptor](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Thinglish_Type_System.md)
- `displayName`: “Class: ClassName"
- `_instanceCounter`: number  
increased by one one on every `ClassName.getInstance()`

### Properties

Classes will be injected additional `properties` during declaration:

- `package`:
  - **getter**: full qualified class name  
**returns** thisClass.namespace.package + "." + thisClass.name
  - **setter**: no op  
Warns that the package should be set in the console and does nothing.
- `implements`:
  - **getter:** Array of Interface Classes  
**returns** \[AinterfaceClass\]

`}`

### Behaviour \[Methods\]

Classes will be injected additional `methods` during declaration:

- `getInstance()`  
**returns** a new object instance of this Class

## Semantical extensions to ES6

### Properties

Classes should add additional `properties` in their code:

- `implements`():  
To implement an Interface, the Interface has to be loaded previously to this Class.
  - **getter:** `static get implements() { return [AnInterfaceClass]; }`  
**returns** Array of Interface Classes

`}`

# TypeDescriptor

The `TypeDescriptor` will be created during Class declaration and describes the typing of a Class in a reflective way.  

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

declaration

## Declaration JSON

```
TypeDescriptor

{
    actionIndex: undefined,
    class: undefined,
    dependencies: undefined,
    extends: undefined,
    interfaces: undefined,
    implements: undefined,
    isInstance: undefined,
    name: undefined,
    namespace: undefined,
    originalClass: undefined,
    package: undefined,
    ucpComponentDescriptor: undefined,
    version: undefined,
    weBeans: undefined,
}
```

## name \[Attribute\]

The fully qualified name of the [Class](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Type_System.md#Class) that is described by this TypeDescriptor. From TypeDescriptor `this.class.package`

## class \[Attribute\]

Reference to the [Class](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Type_System.md#Class) that is described by this TypeDescriptor.

## originalClass \[Attribute\]

This Reference to the [Class](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Type_System.md#Class) that is only relevant, if the Component name is the one of an Interface and the Implementation Class has a different name.

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

example

WODA.component.xml

WODA.class.js

```
class WODA extends Interface {...}

class DefaultWoda extends UcpComponet {...}
```

Then the TypeDescriptor contains

```
TypeDescriptor

{
    ...
    class: DefaultWoda,
    ...
    originalClass: WODA,
    ...
    ucpComponentDescriptor: DefaultUcpComponentDescriptor {name: "WODA.component.xml",...},
    ...
}
```

## extends \[Attribute\]

Reference to the [Class](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Type_System.md) that is extended by the TypeDescriptor `this.class`, in other words, reference to the super class.

## implements \[Attribute\]

Contains the list of all effectively implemented interfaces as an Array of Classes. During [declaration](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Type_System.md#declare-%5BMethod%5D) all these interfaces will be implemented with `Thinglish._addInterface(...)` by adding the missing methods to the Class and with `Thinglish._addImplementation(...)`to the Interfaces TypeDescriptors `this.implementations` Array.

## interfaces \[Property\]

Version \[2.0.0\]  
readonly

- `interfaces`:
  - **getter:** `get interfaces() { return this.object.class.implements; }`  
**returns** the originally implemented Interface list by the TypeDescriptor `this.class`

while TypeDescriptor `this.implements` returns the list of [all effectively implemented interfaces](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Type_System.md#implements-%5BAttribute%5D).

## version \[Property\]

Version \[2.0.0\]  
readonly

- `version`:
  - **getter:** `get version() { return this.namespace; }`  
**returns** the parent namespace of the TypeDescriptor `this.class` which should be a `Version` instance.

### init \[Method\]

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

signatur

#### Parameter: init(`object`)

- `object` should be a JSON that contains the known values of the new TypeDescriptor
  - case `object` is a String
    - then only TypeDescriptor `this.name` is set while `this` is initialized with this [declaration JSON](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/753074177/Type_System.md#Declaration-JSON)

#### Returns: `TypeDescriptor` instance

```
new TypeDescriptor().init({
                    class: classOrFunction,
                    name: classOrFunction.package,
                    package: namespace.package,
                    namespace,
                    isInstance: false
                });
```

The above creates a `Namespace` instance with `name: "Namespaces"`.
