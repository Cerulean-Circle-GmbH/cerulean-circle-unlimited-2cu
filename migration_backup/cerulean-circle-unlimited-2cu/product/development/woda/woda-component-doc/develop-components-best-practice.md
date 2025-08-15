# Develop Components best practice

- [The good and the bad way](#the-good-and-the-bad-way)
  - [How not to do it](#how-not-to-do-it)
  - [All changes in the GUI(HTML) are triggered by the Model!](#all-changes-in-the-guihtml-are-triggered-by-the-model)
  - [The good way to react on a click in the GUI](#the-good-way-to-react-on-a-click-in-the-gui)
- [Keep that in mind for Component development](#keep-that-in-mind-for-component-development)
- [Domain Object Components](#domain-object-components)
  - [Why are they so useful?](#why-are-they-so-useful)
  - [Special things](#special-things)
- [API Connections](#api-connections)
- [What and how should be documented per Component](#what-and-how-should-be-documented-per-component)
  - [Where](#where)
  - [What](#what)
- [Examples for data flow in the Component](#examples-for-data-flow-in-the-component)
  - [1\. Dataflow User Click => API Save and Update View](#1-dataflow-user-click-api-save-and-update-view)
  - [2\. Dataflow User Click => API Save and show the Result on the GUI](#2-dataflow-user-click-api-save-and-show-the-result-on-the-gui)
    - [Bad way](#bad-way)
    - [Good way](#good-way)
  - [3\. Dataflow GUI Click => Update two GUIs](#3-dataflow-gui-click-update-two-guis)
  - [4\. Dataflow Model change from Extern => Update GUI](#4-dataflow-model-change-from-extern-update-gui)
  - [5\. Dataflow External Action change the Model => Update View](#5-dataflow-external-action-change-the-model-update-view)
  - [6\. Dataflow GUI Change Model, another component can access the data](#6-dataflow-gui-change-model-another-component-can-access-the-data)
  - [7\. Dataflow GUI Change Model => fire Event](#7-dataflow-gui-change-model-fire-event)
  - [8\. Dataflow Loading Data from the API during init and display on the View](#8-dataflow-loading-data-from-the-api-during-init-and-display-on-the-view)
- [FAQ WODA-1485 - Getting issue details... STATUS](#faq-woda-1485-getting-issue-details-status)

**Video of Recording Sprint 16**: [http://wo-da.de/RAW/2cuDevVideos/210203\_Sprint-16\_CoP\_Best\_Practice.mp4](http://wo-da.de/RAW/2cuDevVideos/210203_Sprint-16_CoP_Best_Practice.mp4)

## The good and the bad way

### How not to do it

![](https://render.powerplantuml.com/svg/9Ot12i8m44Jl-Oevwi5-W8TIB045lKazBsbi5xTRCHlryqtmCimmRvWk6RqiB-ACJI8ED29-QNaM_s6RKNhB2QmuNYzdLmMx5iF9t_ReXSC3_XtL44WauPur6A_gAb31EYZWJ3f5R7mpDGZ_q0kbj7LTrB7y_m00)

### All changes in the GUI(HTML) are triggered by the Model!

This makes sure...

- All Views are informed about the change
- The Data are saved in the Backend (API)
- No "status" is stored in the HTML. The status can be accessed from other Components.
- It will be possible in the future to store the status of the Component. (E.g. for drag and drop or Saving the App)

### The good way to react on a click in the GUI

![](https://render.powerplantuml.com/svg/JOv12i8m44NtESK_W5wW2obeq49B1QskXtJKO1ebdNX-amZ5vPzvZ__hMIX8d9mIAuwn7nfidJNF5ORtI58kwd3kMgmtk3JwMlt-q1_s0aFEpRX5RyI-lCf01hj-fzj4FiZVMPNqvoTdKH1BpMBcgWed5XmfqCJ2GTNinpJn2m00)

## Keep that in mind for Component development

- Never connect to HTML of a different Component. Always access the Model or functions/Action
- Don’t store data directly in the Component. (this.XXXX) Use this.\_private.XXX or this.model.XXX if it is a core parameter of the Component. Private parameters are not shown in the GUI.
- Use Domain Object as far as possible
- Generic Components should be reusable
  - The model is Public. Don’t change the existing Parameter, only add a new one.
  - Don’t make changes that will affect other consumers. Use new Parameters and Functions and try to avoid changes on existing interfaces (E.g. Model, functions, getter, setter).
  - In case a change f……. new Version
- What view should be used for what? (ItemView, OverView, DetailsView, DefaultView, all other CustomView)
- Expose impotent public Functions with Actions. Is mostly interesting for central Components who exist once on the Page. This makes integrations easier.
- Provide Events for other Component where they make sense
- Relativ path if possible inside a Component *this.type.class.IOR.basePath.* Makes version changes more easy (create getter)
- Write documentation
- Use BEM for styling

## Domain Object Components

### Why are they so useful?

- All API Communications are handled out of the Box
- Loading existing Domain Object is a one-liner
- It is easy to get into Components created by another person as they use all the same structure

### Special things

- Store data in the Model that should not be stored in the backend with a leading underscore

## API Connections

- Put API Connections into the UcpComponent (Not into the View)
- If an API provides multiple object instances create its own Components for them
- Load data as early as possible
  - The best way is to load the data already at the init of an Object or directly afterward
  - If the API promise is finished the data should be stored in the model.
  - If that is not possible maybe an external Event trigger the Loading. E.g. Login Event
  - As it may take a while to get the Data from the API we show at first generate an HTML without filled data and fill it later on if the update function is called.

## What and how should be documented per Component

### Where

- The location for Documentation ComponentXXX/1.0.0/doc/
- The Format should be Markdown in the File: ComponentXXX.md
- UML is also helpful (The UML definition can be included in the Markdown file)
- Example in ideal Component?!

### What

- The purpose of the Component
- How to use the Components in a few sentences. E.g. *“Use the add Function for Adding new Components into the list. Keep in Mind that Item Views will be displayed in the List. To remove a Component from the list use …..”*
- Bookmarks with Tags (To be done, Project Angie)
- Example code how to use the Component is also possible.
- Dataflow (E.g. Component and subComponents)

## Examples for data flow in the Component

The following UML diagrams should be a guideline for creating/changing of Component.  
Keep in mind that all diagrams are only snippets of the whole dataflow of a Component. They can be mixed as you like.

### 1\. Dataflow User Click => API Save and Update View

![](https://render.powerplantuml.com/svg/LOz13e9034NtSuf_0Bq02uCAKHA898gk6wOgOHWC5Cxl312Co_w-_Bw6lL0dGsEKL68OfoB1qLHblS4-Jz3Jo1iK7qqoxTJvbgNOxd1FuaSmauX7jeAIZEdn76mfLMkL1poONQ8uTUIRx8lLDFcujLchsSnnW8Y45aQhlvs7dKc0grE1j3XGMRFLlwf5nPrVhsEOZ5S9R-qQM91JHmqBTofq9UxlBm00)

### 2\. Dataflow User Click => API Save and show the Result on the GUI

##### Bad way

![](https://render.powerplantuml.com/svg/DOxB2i8m54Jt-OgXw_O7if2g50rK4EjZ7TA8fJ6HvgR5l_S6wNhEd9awafuelPsWWPp5JlTOz5VYS5CmRZ1ZYUrP8UhPbkXUOS5auoVuQCNnUcfHRN1NpKDYds4qi_K4evsBU2PlQ0XUP223B9Bes0GAl6H6wtkHxHM7HQOAYSkgNrjvHlwd-IobA6hkyUKV)

##### Good way

![](https://render.powerplantuml.com/svg/PP3BRW8n34Nt-OehrbJiiwXeouYEn0ZKAR2ECfuo8jXLue7VRm9zg69ftoFv-CwJkgZZAHWTD12Msne-3FuunTEcHd9dcg8zo0MHqgTm8lFwtgpmy8XTNUqjNWgCwaoiy2w4X7vahuEmAK01c_MYMcNouFY3p7KgQ-56EWgtjSN2gVjcElClAt2MiMYp3LJmxFoHk3F5C6SJuNRqdbAQLJ5Ad5Yy_SZUPN_cDVSIJzWDTFbLBR_Psx-v61sJcUT3kPul)

### 3\. Dataflow GUI Click => Update two GUIs

![](https://render.powerplantuml.com/svg/XP312i8m44Jl-Ohz0Brux44AjcYWHK5RZx8qgmQJAErMVz-qGZ0gUDnXvismQSVOSc-DOCs6O5b9M1ZTN2PGtHGomMpGn6fN5WV9P6jD3vZEePRvFWZ9AmFvdHn3WyPqSEnTm_hgHEGSekKwomiVEQCxaHYlNqHF2H3enp7Vh6XN0bjYs62BbfZQ3tH6ZDgG-eT_zuMAE1pNfEIK_-0J)

### 4\. Dataflow Model change from Extern => Update GUI

![](https://render.powerplantuml.com/svg/NO_13e8m38RlUue-0Bu01uD1eYGiaY1wRbWHagqZepC-lWnldfhs_velVx4A1edEAfd54j17A31QAD7Q34vj3Hs-1ygWNmmAmQMl5RANYKBftUAPME1mX8va-ypJX1O3EjfM68DtuAEiio7rGnAiR-UgoQ6Sa5y4sXkoQh-by55NptptmnXvaDapn5skKfIGwrqtVofL49kjnnS0)

### 5\. Dataflow External Action change the Model => Update View

![](https://render.powerplantuml.com/svg/NOz12i8m44NtESKSG3r05rAfHGij5RIw7flH5j99YHFm-2Qnk70rvB_Fcqd-4dJY9wDa54D0Ro77Q63NosXv1TsiKGWENQMGhGpa2ZlDbea5rjkbjj4sWmADWTdVpTW3fbZzQAoUIO8xYnDEw72Yy5JVDFActPTrq0p8JuB6QZ8gPH5Ug_Ash7XuJbhmwJGLKQmSBqtzRy-9TVZS1m00)

### 6\. Dataflow GUI Change Model, another component can access the data

![](https://render.powerplantuml.com/svg/LP3T3e8m34RlznJV0-0Ba60qI9G4uozwlOognB6PqPduzWw8g9Tjp-dNTDQoTEmRBRXcJLYMEL9Tgtk4yb59xZiHvafHsu9lXCPMfCNgk2umcUAKP-TuC90zoJ2KrBh5nHl5jJMY0pfmlLbaHI1lqbn9zDMF7vnHWU-3HxEBYd4WnbOwsH2J4qa27HY7W2U9iE4mbzhcOKrtmZTkvycz4DR9JsIO_TCnziJUcO6QaQd2Dzu0)

### 7\. Dataflow GUI Change Model => fire Event

![](https://render.powerplantuml.com/svg/TT1B3e8m40RWVKyn1q0FmCAGy50IY1kVowOKRIXJ0uFdjrCqH1EN_UVBp9yc8yc1fjuACcGrR8ybA6jK5u6wIxnfg5sZRGIj6JJaJuqaTeUwWjK6JcL-ZY5bFKz0IMj7Q2TKP1mA1WphVPPNNeQ58hmuTXXspt4CcIJvDetucZ4E1zRS8ePYwRB4Z5BNFnpwvEAl-IvGVAhySTTVbsXi_6-y0000)

### 8\. Dataflow Loading Data from the API during init and display on the View

![](https://render.powerplantuml.com/svg/TL7BRi8m4BpxA-RO7j8FY9eA11UaFbMrmAaoyG86nuwSTH5_NzkDI2hHYxKxcjcTMKywbfv3OmHhDeH79nNcaYLKyDhkeArcCNDDkqBnW5Iixn9MOX5Vl6mELBEGDUjloJGYYA5Cokdhukija3-NcBwldsS9G0O6yONpHzklNPNP2-fO6s8IYlxREh8wfwqCXZyrdKhiY4TzJxqlYcjSJnoyHMfmizIy1pKjd_7a59bRKLLOokXcwpnuJzZ8-aXMWLrKTgsp7Q6gn2LHZf6r9JvQbKpd3gSqEjqY7NsSQJZ6B_5wf7vMpZE91k9F_W00)

## FAQ  [WODA-1485](https://2cu.atlassian.net/browse/WODA-1485) - Getting issue details... STATUS

- How to find the responding UcpComponent with Path to an HTML Element?
  1. Select the HTML Element with the Inspector![](./attachments/image-20210202-115845.png)
  2. Execute the following command: Current($0).ucpComponent.IOR.basePath
- How to find Components in the Domain for a specific purpose?