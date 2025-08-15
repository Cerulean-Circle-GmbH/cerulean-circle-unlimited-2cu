[📁 Shift Gmbh Development](../shift-gmbh-development.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/400000054/shifter-netzwerk-snet.md) | [🌐 Page Structure local SymLink](./shifter-netzwerk-snet.page.md)

# Shifter Netzwerk (SNET)

## The Aim of the System:

The Shifter Netzwerk should enable interested parties, customers, and dealers to form a network for using and getting to comprehend shift products. An example of this would be the possibility for interested parties to have a certain device demonstrated live by other customers who already have such a device.

Furthermore, technically inexperienced people are to be brought together with experienced people to support the repairs of their Shift devices.

In addition to the pure private individuals, dealers can also use this network to get potential customers into their business or to offer repairs.

Collection points for old hardware who is not included in our deposit system should also be offered.

## Ideology / Rules

1. Safety (meeting in public places and not alone)
2. Honesty (not talking about devices nicely, but also not badly)
3. Mutual appreciation

## Consumer

1. **Prospectively** registered person/user without an offered service (with or without hardware)
2. **Private Shifter**
  1. **Ambassador** who helps others with questions or shows his device
  2. **Supporter** helps regarding the handling of devices
  3. **Repair** helps others repair their devices
  4. **Return** collects old devices and accessories e.g. in a public or non-public box
3. **Business Shifter** marked as a company (can also offer services such as repair and recycling)
  1. **Ambassador** who helps others with questions or shows his device
  2. **Supporter** helps regarding the handling of devices
  3. **Repair** helps others repair their devices
  4. **Return** collects old devices and accessories e.g. in a public or non-public box
  5. **Dealer** is selling Shift products

## Idea

- The system is rebuilt with ONCE + jHipster Server
- Basic function:
  - What offers are there near me? (Map + list of shifters)
  - Filters on devices and services (view, repair, etc.)
  - Private Shifter are rewarded with a bonus for their services
  - Messanger to contact service Provider
- A user always has a private address
- A user can have up to 5 addresses where he can meet with interested parties. These meeting points can optionally be shared on the map.
- User can customize meeting points (e.g. for travel, holidays, assembly, etc.)
- Validation of email (double opt-in), phone number via SMS?

## Delimitation

- No platform for Messaging between Prospectors. Only Prospectively to the service provider.

## Nonfunctional requirements

- In 1 - 5 years
  - Registered user up to 10K
  - Peat load based on the experience of TV Shows accesses
- In 5 - 10 years
  - Registered user up to 50K
  - Peat load based on the experience of TV Shows accesses \* 5

## General questions

- How to handle international translation? German in the first place. English later on.
- How to provide the option for feedback?

# Pages & Design:

Design Video:

![Video not showing... Error...](./attachments/SNET-Figma-Design-Overview-01.mp4)

  
[Figma Desktop Preview](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/575340560/Shifter_Netzwerk.md)  
[Figma Mobile Preview](https://www.figma.com/file/wJyh9tIUpPpqSbqLVgwinT/Shifter-Netzwerk-Proto?node-id=773%3A1131)

[Figma combined Document](https://www.figma.com/file/wJyh9tIUpPpqSbqLVgwinT/Shifter-Netzwerk-Proto)

## Map:

- On the left a list with all the offers shown on the map
- When you focus, the offer is highlighted on the map and in the list
- The filter restricts the selection on the map and list
- It is possible to directly start a conversation based on a service provider
- The company address is shown on the map
- In case the user is not logged on he can see the map and search
- In case of an overload (TV show), a tutorial video on youtube should be shown

### GUI Points

- The map is accessible without a login
- Favorites are displayed with stars
- In the map backend design, the colors should be changed
- The result list is limited to 20 results
- Design of an Element on the map
  - The color indicates private / customer service
  - In the icon, the device(s) shall be shown
  - At the borders, the provided services shall be shown
- Liquid browsing
  - No grouping is used on the map.
  - At a close zoom level, the full icon with services is shown.
  - The icons are getting smaller if zoom out
  - At some point, the icons change to only colored pixel
  - There are two ways of Navigation
    - Navi mode
      - The navigation is normal ( move and zoom)
      - The century mark my actual position
      - The result in the list is shown depending on the distance to my position
      - A circuit around my position is shown to indicating the search range
      - If the map moves my position changes as well and the result list is created new
    - Selection mode **(later)**
      - The circuit is created manually on the map
      - Another way of moving is needed

### Map marker

[Shifter-Netzwerk-Marker-Fav-SVG-02.zip](./attachments/Shifter-Netzwerk-Marker-Fav-SVG-02.zip)

Mini Icons (hover) added (15 Jan 2021)

Desktop Design - Start screen

Desktop Design - Close Zoom level

Mobile Design - Start Screen

Mobile Design - Close Zoom level

Mobile Design - Click on user

### Open points

## Login

## Registration

## User Config

### GUI Points

- During the Service offering process, the user must read the 3 Rules of the Portal
- The account can be disabled with a defined period for deletion
- To offer a service the Client must own the product

### Parameter:

- Registration:
  - Username
  - Email address
  - Password
  - Registration date
- Additional User Parameter
  - Avatar Picture **(later, for the chat)**
- Service Provider
  - Mobile number (M)
  - First name / last name (M)
  - Private / company address (M)
  - Own devices (serial number e.g. IMEI ) (M)
  - Services offered with selected product groups/products (M)
  - Meeting points (5)
  - Service Deactivation period (User can disable all services, optional end date)
- Shop
  - Opening times
  - Homepage
  - Description text
- Non-Config Parameter
  - My reviews/harts (Collected Hards are shown top right next to the user icon)
  - My collected Coins (list of transactions, actual state top right next to the user icon)
  - My Shifter ID (unique ID for the rewarding process)

### Points:

- Mobile number needs to be verified for a service provider (Pin send with SMS)
- In the background, the serial Number is enhanced with Device information. If that fails regarding lag of information we need a process on how to handle that.
- Services Repair, Return, Dealer need an manual approval process
- Services Repair and Supporter needs an owned device in the same device group
- Service Ambassador need the device for the Service

#### open points

- How many active Meeting points are possible?

### Future extensions

- Give away Coins to other User
- Give away Coins to an organization (e.g. Ecosia)
- Private Shifter sell their Products over the Shifter Network **(later)**

### Points:

- Coins are not usable directly, as the order can be canceled

## Favorite (Not included in Sprint 12)

## Messages (Not included in Sprint 12)

### GUI points

- I can contact the service provider and reply to messages
- It is possible to suggest one of my meeting places in chat
- A reporting system for bad people in the network
- Displayed Parameter
  - Usual response time
  - Real name is displayed after request acknowledgement
- Rating System
  - Only Positiv and Negativ ratings are possible (heard and broken heard)
  - Raiting is possible in two directions
  - Raitings for serviceconsumer are not displayed for other customer
  - Text is also possible
  - For other people only positive ratings are visible
  - It is possible to see own negative ratings
  - Description of how the Rating System works in the GUI
  - Award a medal of honor **(later)**  

### Open points

- Which type of messanger should be used?
  - In-house development
  - External messengers such as signal or matrix
- First workaround only as an email notification to establish contact?
- How to start rewarding Processes after consuming a service?
