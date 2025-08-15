[📁 Woda Component Doc GitHub](/cerulean-circle-unlimited-2cu/product/development/woda/woda-component-doc.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/woda/woda-component-doc/multilanguage.md) | [🌐 Index Structure local SymLink](./multilanguage.entry.md)

# Multilanguage

![](./attachments/Universal%20Translation.png.png)

![](./attachments/MultilanguageRelations.png.png)

Render Flow

![](./attachments/MultilanguageStartup.png.png)

On Language change

![](./attachments/onLanguageChanged.png.png)

## Interface Multilanguage

Methods:

- MLC: (input: textTemplate, \[language\]) Return the responsible MultilanguageController
- MLCRender: render the given Text. Calls the MLC with its own and the ‘EN’ if no language is defined
- onLanguageChanged: Will be called if the Langage has changed
  - By default, it will start a full rerender of the current View or all Views in case of an implementation in a UcpComponent

## MultilanguageController

### UcpComponent Methods:

- render (input: text, Language (Text), ComponentInstance)
- activeLanguage return activeLanguage
- templateHelper: return helper who can be used in the Template

### Views

- Admin View with an overview of all related TranslationTemplate (TT)
  - Configure allowed Languages
  - Configure active Languages
  - Overview of all TranslationTemplate
    - Filter by ComponentClass
    - Duplicate TT
  - At the right the EditView of the TT
- AppView
  - Only a small dropdown the active Languages
  - On change, all Classes that implements “Multilanguage” interface needs to be called (onLanguageChanged)

## TranslationTemplate

### model

- key (Key is the md5 hash of the original template Text in the Component)
- class
- language
- templateText

### UcpComponent Methods:

- render (input: text, ComponentInstance, MultilanguageController)

### Views

- EditView
  - Ability to change the Template (Text)
  - Ability to change the Language
  - Ability to make a test Render (think about the Reference to the Instance)
- ItemView
  - key
  - Display ClassName
  - Language
  - The first ? characters of the Text

## Example Component Implementations:

Example in the Javascript Code:

```
this.documentelement = this.MLCRender('This is my text to translate. With $--{this.model.linesCount} to display!','EN');
```

Template example:

```
<template id="DetailsPanel" is="woda-details-panel">
        <div class="$-{this.model.cssClasses} fullHeight" style="padding: 0px">
				$-{this.MLCRender('This is my text to translate. With $--{this.model.linesCount} to display!. Current Date: $--{templateHelper.date.local(ONCE.now())}','EN')}
        </div>
</template>
```
