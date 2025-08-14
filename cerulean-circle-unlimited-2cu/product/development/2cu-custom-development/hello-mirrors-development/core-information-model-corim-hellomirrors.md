# Core Information Model (CorIM) HelloMirrors

Description of the functional model of HelloMirrors

## Overview

- [Overview](#overview)
- [Vision / Value Proposition (Draft)](#vision-value-proposition-draft)
- [Actors](#actors)
- [System Context](#system-context)
- [Domain Model (Draft)](#domain-model-draft)
- [Glossary](#glossary)

<put CorIM pdf overview here> ***FreeMind template is attached to this page!***

## Vision / Value Proposition (Draft)

Proffesional personalized collaborative crossselling plattform  dedicated to Health - Wardrobe - Training that also eneables you to extends your skillset while utilzing the functionality of a Mirrorscreen

Ideas collection

- A professional and visually responsive Personal Trainer system for home use alone and with friends
- Interactive touch Mirror to Workout, Learn new skills and manage health from the comfort of a home
- Bring essential workout components to a home

*Pitch slogan idea:*  
*Mirror mirror on the wall*  
*who's the prettiest of them all, wokest of them all, the healthiest of them all:*  
*HelloMirrors answers: "You"*

## Actors

- FamilyMember
- PersonalTrainer
- Admin
- System/Time

## System Context

### Overview

![](./attachments/CorIM-HelloMirrors-SC.png.png)

### Use Cases (Draft)

![](./attachments/CorIM-HelloMirrors-SC-detail.png.png)

### Business Processes and Use Cases

- [BP maintaining Communities (Draft)](https://2cu.atlassian.net/wiki/spaces/CCU/pages/901775387/BP+maintaining+Communities+Draft)
  - [UC inform FamilyMember](./2cu.atlassian.net/wiki/spaces/CCU/pages/890142833/UC_inform_FamilyMember.md)
  - [UC control SytemAccess\*](./2cu.atlassian.net/wiki/spaces/CCU/pages/907411469/UC_control_SytemAccess.md)
  - [UC modify Feedback](./2cu.atlassian.net/wiki/spaces/CCU/pages/906919945/UC_modify_Feedback.md)
  - [UC modify Membership\*](./2cu.atlassian.net/wiki/spaces/CCU/pages/906919976/UC_modify_Membership.md)
  - [UC modify FamilyMemberProfile](./2cu.atlassian.net/wiki/spaces/CCU/pages/907411504/UC_modify_FamilyMemberProfile.md)
- [BP encouraging Personal Skills (Draft)](https://2cu.atlassian.net/wiki/spaces/CCU/pages/902103075/BP+encouraging+Personal+Skills+Draft)
  - [UC present FamiliyMemberStatus](./2cu.atlassian.net/wiki/spaces/CCU/pages/907411547/UC_present_FamiliyMemberStatus.md)
  - [UC present JourneyStatus](./2cu.atlassian.net/wiki/spaces/CCU/pages/907411578/UC_present_JourneyStatus.md)
  - [UC present LessonStatus](./2cu.atlassian.net/wiki/spaces/CCU/pages/906920015/UC_present_LessonStatus.md)
- [BP educating Health (Draft)](https://2cu.atlassian.net/wiki/spaces/CCU/pages/902135848/BP+educating+Health+Draft)
  - [UC modify VitalData](./2cu.atlassian.net/wiki/spaces/CCU/pages/906920042/UC_modify_VitalData.md)
- [BP maintaining ProffesionalWorkouts (Draft)](https://2cu.atlassian.net/wiki/spaces/CCU/pages/890535995/BP+maintaining+ProffesionalWorkouts+Draft)
  - [UC control Lesson](./2cu.atlassian.net/wiki/spaces/CCU/pages/907411625/UC_control_Lesson.md)
  - [UC download Lesson\*](./2cu.atlassian.net/wiki/spaces/CCU/pages/906920077/UC_download_Lesson.md)
  - [UC provide SpotifyPlayer](./2cu.atlassian.net/wiki/spaces/CCU/pages/907411656/UC_provide_SpotifyPlayer.md)
  - [UC modify Journey](./2cu.atlassian.net/wiki/spaces/CCU/pages/906920108/UC_modify_Journey.md)
  - [UC modify Lesson](./2cu.atlassian.net/wiki/spaces/CCU/pages/907411688/UC_modify_Lesson.md)
  - [UC modify Library\*](./2cu.atlassian.net/wiki/spaces/CCU/pages/906920136/UC_modify_Library.md)
- [BP maintaining DigitalWardrobe Draft](./2cu.atlassian.net/wiki/spaces/CCU/pages/901709873/BP_maintaining_DigitalWardrobe_Draft.md)
  - [UC modify Product\*](./2cu.atlassian.net/wiki/spaces/CCU/pages/907411727/UC_modify_Product.md)
- [BP utilize Mirror (Draft)\*](https://2cu.atlassian.net/wiki/spaces/CCU/pages/902135861/BP+utilize+Mirror+Draft)
  - [UC connect Mirror \*](./2cu.atlassian.net/wiki/spaces/CCU/pages/907411754/UC_connect_Mirror.md)
  - [UC modify MirrorSettings \*](./2cu.atlassian.net/wiki/spaces/CCU/pages/906920192/UC_modify_MirrorSettings.md)

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

List of all BP and UC

### BP maintaining Communities

*Goal: be collaborative*

#### UC inform FamilyMember

*What: Visualize Branding*

#### UC Control SytemAccess\*

*What: authenticate and authorize FamilyMember for Access*

#### UC modify Feedback

*What: Create & Search, Read, Update, Choose, Delete Feedback*

#### UC modify Membership\*

*What: Create & Search, Read, Update, Choose, Delete Membership*

#### UC modify FamilyMemberProfile

*What: Create & Search, Read, Update, Choose, Delete FamilyMemberProfile*

### BP encouraging Personal Skills

Goal: learn/teach new Skills

#### UC present FamiliyMemberStatus

*What: Visualize FamiliyMemberStatus*

#### UC present JourneyStatus

*What: Visualize JourneyStatus*

#### UC present LessonStatus

*What: Visualize LessonStatus*

### BP educating Health

Goal: educate on HealthSkills

#### UC modify VitalData

*What: Create & Search, Read, Update, Choose, Delete VitalData*

### BP maintaining ProffesionalWorkouts

Goal: offer Professional Home Workout

#### UC control Lesson

*What: Play, Pause, Forward, Backward, Skip the VideoLesson*

#### UC download Lesson\*

*What: Download Lesson to HelloMirrorDevice*

#### UC provide SpotifyPlayer

*What: Use & Read SpotifyPlayer*

#### UC modify Journey

*What: Create & Search, Read, Update, Choose, Delete Journey*

#### UC modify Lesson

*What: Create & Search, Read, Update, Choose, Delete Lesson*

#### UC modify Library

*What: Create & Search, Read, Update, Choose, Delete Library*

### BP maintaining DigitalWardrobe

Goal: offer Digital Wardrobe

#### UC modify Product

*What: Create & Search, Read, Update, Choose, Delete Product*

### BP utilize Mirror

Goal: immersion into Mirror

#### UC connect Mirror \*

*What: connect Mirror with other Devices*

#### UC modify MirrorSettings \*

*What: Create & Search, Read, Update, Choose, Delete MirrorSettings*

\*Not fully described

## Domain Model (Draft)

![](./attachments/CorIM-HelloMirrors-DM.png.png)

## Glossary

| **Type** | **Term** | **Description** |
| --- | --- | --- |
| Process words | modify | Create Read Update Delete (CRUD ) |
| Process words | call | choose a navigation |
| Process words | choose | Alias for select |
|     | progress | % complete |
|     | Professional Workout | Qualatative Workout experience with visual feedback and a high degree of customization |
|     | PersonalBoard | Family Member Board |
|     | PersonalLevel | Family Member Level |
|     | FamilyMemberProfile | Personal Training Account |
|     | FamilyMemberOverview | PersonalStartPage |
|     | Training | Opens Personal Board |
|     | JourneyTeaser | What you will Learn segment from JourneyDescription |
|     | JourneyMyJourney | Journey attribute that signifies the featured Journey, triggered on JourneyStart |
|     | Training | Overarching term for actions available in the Training Tab |
|     | Journey | Workout Video Set linked to a Trainer/Difficulty/Type |
|     | Lesson | Individual Workout Video linked to a Journey |
|     | Membership | Subscription linked to FamilyMember Profile(s) |
|     | LessonFeedback | Summary of Vital data + LessonProgress |
|     | LessonStatus | LessonProgress |
|     | LessonDetails | Jounrney Detail Pages in the course: [Desciption Journey Detail Page MVP1](./2cu.atlassian.net/wiki/spaces/CCU/pages/636223509/Desciption_Journey_Detail_Page_MVP1.md) |
|     | LessonProgress | % of lesson done |
|     | LessonCheckmark | check marks for view, not finish, Part of LessonStatus |
|     | LessonMyList | Favorite Marking |
|     | JourneyDashboard | Gui that shows multiple Journeys as JourneyThumbnail : JourneyName : JourneyProgress |
|     | JourneyStatus | JourneyProgress |
|     | Journey ProgressBar | GUI Progressbar on top of Lesson .\_\_.. based on LessonProgress per Journey |
|     | JourneyProgress | % of lessons learned |
|     | JourneyOverview | Highlights of things that can be learned in the Journey |
|     | JourneyFeedBack | DaysTrained |
|     | Products | products that are found in the Videos |
|     | TrainingStatus | Report of Training |
|     | VitalData | HeartRate, Time in Workout, Calorie Count |
|     | Wardrobe | Fashion Content |
|     | Health | Connect with Medical Experts |
|     | LessonDifficulty | Difficulty of Workout linked to the Video |
|     | Feedback | The information the FamilyMember shares with the system |
|     | Personal Skills | Workout Practises Dances, Meditation techniques, the skills offered by the Training Segment of the app |
|     | BootInformation | The assents shown on the BootScreen: Animated HelloMirrorLogo |