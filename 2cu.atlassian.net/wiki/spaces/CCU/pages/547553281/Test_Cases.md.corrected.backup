# RAIR Architecture Specification

- [RAIR Overview](#rair-overview)
- [RAIR Roadmap](#rair-roadmap)
  - [Phase #1: Dockerize RAIR into microservices + iFrame Frontend!](#phase-1-dockerize-rair-into-microservices-iframe-frontend)
  - [Phase #2: Back everything up to IPFS + Kubernetes!](#phase-2-back-everything-up-to-ipfs-kubernetes)
  - [Phase #3: Blockchain Mainnet](#phase-3-blockchain-mainnet)
- [RAIR Token](#rair-token)
  - [About the RAIR token](#about-the-rair-token)
  - [Things will be able to do with the RAIR token on Ethereum](#things-will-be-able-to-do-with-the-rair-token-on-ethereum)
  - [Things we can only do after phase 3 mainnet](#things-we-can-only-do-after-phase-3-mainnet)

- [Current Functional Requirements](#RAIRArchitectureSpecification-CurrentFunctionalRequirements)

  - [Admin Panel](#admin-panel)

  - [Upload Video](#upload-video)

  - [Watch Video](#watch-video)
- [Future Functional Requirements (TODO)](#RAIRArchitectureSpecification-FutureFunctionalRequirements(TODO))

  - [RAIR Node Setup](#rair-node-setup)

  - [iFrame embed all crypto components - VP SOFTWARE TEAM FRONTEND](#iframe-embed-all-crypto-components-vp-software-team-frontend)

  - [Basic video site type functionality - VP SOFTWARE TEAM FRONTEND](#basic-video-site-type-functionality-vp-software-team-frontend)

  - [Wodafied backend - VP SOFTWARE TEAM BACKEND](#wodafied-backend-vp-software-team-backend)

  - [ETH App Integrations](#eth-app-integrations)
- [Non-functional Requirements](#RAIRArchitectureSpecification-Non-functionalRequirements)

  - [Licensing](#licensing)

  - [Characteristics](#characteristics)
- [Design](#RAIRArchitectureSpecification-Design)

  - [Use Case 1: View Video](#use-case-1-view-video)

  - [Use Case 2: Uploading a Video](#use-case-2-uploading-a-video)

  - [Use Case 3: Finding and registering for videos](#use-case-3-finding-and-registering-for-videos)

  - [Sequence Diagram](#sequence-diagram)

  - [Sequence Diagram 1 - Upload a Video](#sequence-diagram-1-upload-a-video)

  - [Sequence 2 - Make an offer](#sequence-2-make-an-offer)

  - [Context Diagram](#context-diagram)

  - [The RAIR dApp and its surrounding environment](#the-rair-dapp-and-its-surrounding-environment)

  - [Mid- Level Design](#mid-level-design)

  - [Front End to Mid-Level](#front-end-to-mid-level)
- [Coding](#RAIRArchitectureSpecification-Coding)

  - [UML Class Diagrams](#uml-class-diagrams)

  - [Frontend](#frontend)

  - [Website Development](#website-development)

  - [Backend](#backend)

    - [Web Server](#web-server)

    - [Database Server](#database-server)
- [Testing](#RAIRArchitectureSpecification-Testing)

  - [Test Plan](#test-plan)

    - [Testing Process](#testing-process)

    - [Requirements Testing](#requirements-testing)

    - [Test Recording Procedures](#test-recording-procedures)

    - [Testing Tools](#testing-tools)

    - [End to End Testing](#end-to-end-testing)

    - [User Acceptance Testing](#user-acceptance-testing)

    - [Automated Testing](#automated-testing)

    - [Test Issues](#test-issues)

    - [Functional Test Cases](#functional-test-cases)
- [Deployment](#RAIRArchitectureSpecification-Deployment)

  - [Deployment Plan](#deployment-plan)

  - [Waterfall Deployment](#waterfall-deployment)

  - [Project Deployment](#project-deployment)

  - [New Version Deployment](#new-version-deployment)

  - [Deployment Recording Procedures](#deployment-recording-procedures)

  - [Deployment Tools](#deployment-tools)

    - [Software/Hardware](#softwarehardware)

  - [Potential Issues and Resolutions](#potential-issues-and-resolutions)

    - [Potential Issues](#potential-issues)

    - [Resolutions](#resolutions)
- [Maintenance](#RAIRArchitectureSpecification-Maintenance)

  - [Maintenance Plan](#maintenance-plan)

  - [Regular Maintenance](#regular-maintenance)

  - [Failure Maintenance](#failure-maintenance)

  - [Perfective Maintenance](#perfective-maintenance)

  - [Potential Issues](#potential-issues)

  - [Maintenance Recording Procedures](#maintenance-recording-procedures)

  - [Maintenance Resources](#maintenance-resources)

  - [Transition Process](#transition-process)

Deployment Diagram

[RAIR backend node diagram](https://2cu.atlassian.net/wiki/spaces/CCU/pages/1228963849/RAIR+node+diagram+6+23)

Smart Contracting Logic

[https://docs.google.com/document/d/1E2n5ZUif9CkUxd9r3xDrhl8LEF48p58tsfcwA9RL-xQ/edit#heading=h.797kgojo3g47](https://docs.google.com/document/d/1E2n5ZUif9CkUxd9r3xDrhl8LEF48p58tsfcwA9RL-xQ/edit#heading=h.797kgojo3g47)

## RAIR Overview

At the highest level, RAIR (in POC form) is about using **NFTs** (non-fungible tokens) to unlock **streaming** files hosted on **IPFS** by using the **Metamask** application.

- NFT: Current spec uses the Ethereum blockchain. While extremely expensive and slow to use compared to other blockchains. Ethereum is the luxury brand in the space where the most expensive NFTs are sold. Because of this, we built the initial POC on Ethereum.
- Streaming: We use the Apple HLS streaming standard using FFMPEG to convert monolithic MP4/MOV files into a series of streaming chunks. These chunks the master .m3u8 and .ts files along with a rair.json file are encrypted using NPM RAREIFY to create encrypted output we then upload (pin) to IPFS
- IPFS: Interplanetary file system is a distributed storage protocol developed by Ethereum/Filecoin developers. IPFS allows you to store files and folders in a similar manner to Bittorrent technology. Instead of a centralized repository of magnet links, IPFS hosts hashes of links to ensure no single point of failure can remove content from IPFS. However, IPFS does not natively provide monetary incentives for cloud providers to keep your files pinned to the network. As such we pay pinata. cloud 15 cents per GB per month to store a redundant copy of each folder.
- Metamask: This is a browser extension application that allows users to send transactions through the Ethereum blockchain using an interface. Signing cryptographic challenges with Metamask is how we verify the user can the correct credentials to stream videos.

The future goal for RAIR is to be able to **stream any file** securely from IPFS. To accomplish this, each file type we support must have an accompanying encrypted viewer.

While we are starting with one useful file type (streaming video), we will be able to use the same architecture to also encrypt other forms of media (eBooks, CAD files, etC) and most importantly source code…

...so Marcel can sell WODA components via NFT ![(smile)](https://2cu.atlassian.net/wiki/s/1732347312/6452/9ec310e9ed617fde640b4372fb0e11f5501675fa/_/images/icons/emoticons/smile.png)

## RAIR Roadmap

### **Phase #1: Dockerize RAIR into microservices + iFrame Frontend!**

- Frontend: This should be a simple “dumb” frontend where all information needed to serve content exists in a very small footprint (Alpine Linux or equivalent). Frontend needs extensibility to future file type support. .ePub/PDF eBook reader, etc.
  - Embed all popups like metamask inside of RAIR app, as well as embed Opensea, Rarible, etc inside RAIR UI.
  - Use Hellomirror frontend video store UI as template, can do custom css to differentiate later
  - We can use the Hello Mirrors video components to help jumpstart this. They can also use our NFTs later to sell their content with ![(smile)](https://2cu.atlassian.net/wiki/s/1732347312/6452/9ec310e9ed617fde640b4372fb0e11f5501675fa/_/images/icons/emoticons/smile.png)
- Backend: WODAify Backend services into components
  - IPFS - each RAIR node needs its own local instance of IPFS running to ensure a locally cached copy of the video files is available when a user requests a stream. This also increases the distributed nature of IPFS as each node is also an IPFS node which can help to share the bandwidth load with other nodes.
  - FFMPEG - an elastic FFMPEG engine should receive mp4 files from RAIR nodes and perform the processing inside dedicated
  - Additional Services - such as ETH Auth and other blockchain integrations down the line can be handled from their own Docker images.
  - Remaining Backend: The core backend services to manage the RAIR node including the important lowdb store.json file, and env file. Env file is encrypted and programmatically generates JWT secret in a secure way

### **Phase #2: Back everything up to IPFS + Kubernetes!**

Make sure the core non-functional priority of RAIR is met - Survivibility.

- This means encrypting all docker images, manifest files, etc into IPFS.
- Then using the RAIR NFT unlock mechanism to unlock the files only with the correct DRM admin token.
- Then making sure each server has all services installed locally (IPFS, Eth-Auth, FFMPEG, etc)
- Kubernetes manager for Docker images to elastically expand and contract depending on user demand.
  - The nice thing about NFT based DRM is no DDOS attacks are possible beyond the number of token holders. EG if 1,000 copies of a video are available a maximum of 1,000 requests can be made to stream the video. They could DDOS the frontend but not be able to request any higher bandwidth-rich media streams.

### **Phase #3: Blockchain Mainnet**

- Native NFT minting and royalty logic on ETH compatible Blockchain (Telos, Cardano, NEAR)
  - Offer consumers a **direct minting service**. (Actually on a real blockchain - not Lazy minting like Opensea where it’s really a Google database until you spend the gas)
  - The ability to **mint NFTs cheaply and at scale** with an ETH compatible blockchain network. This is where RAIR moves away from [Opensea.io/Rarible](http://opensea.io/Rarible) etc and mints its own NFTs natively. This will give us control over royalty logic and a new default option for users to mint/transfer/sell more cheaply.
  - **Royalty logic:** More advanced royalty smart contracts with multi splits, and fund structures to allow NFT bundling into NFT funds like $Whale.
  - **Multichain support:** Allow users to pick which networks they want to use and show a price comparison for each blockchain.
  - **Cross-node communication:** Allow nodes to share overlapping registries of content for searching across nodes.
- Custody The ability to create a username/password/forgot password type functionality. This would replace Metamask with our own internal key management system. Keys could optionally be stored with an insured custodian.

## RAIR Token

### About the RAIR token

- The RAIR token is an ERC-777 Smart Contract minted on the Ethereum Blockchain on 9 June 2020
  - [https://etherscan.io/tx/0xa2b756eb7665a2b7a02371606b7fd8aad40338fd3a6dffd1f9a538c16bdeddd0](https://etherscan.io/tx/0xa2b756eb7665a2b7a02371606b7fd8aad40338fd3a6dffd1f9a538c16bdeddd0)
- The main contract page can be viewed here
  - [https://etherscan.io/token/0xf0EBE73fdaE61B305132fD1873C98FB5C4735b40](https://etherscan.io/token/0xf0EBE73fdaE61B305132fD1873C98FB5C4735b40)
- The goal for the RAIR token is to serve as the fungible utility token for the RAIR node network
  - Fungible means any one RAIR token is exactly like any other (Just like Bitcoin!)
  - There are 10,000,000 fixed supply RAIR Tokens that will ever be created

We can do interesting monetization techniques with the RAIR tokens. But unfortunately not on the Ethereum mainnet ![(blue star)](https://2cu.atlassian.net/wiki/s/1732347312/6452/9ec310e9ed617fde640b4372fb0e11f5501675fa/_/images/icons/emoticons/72/1f61e.png)

 as it is too expensive to incorporate advanced royalty logic.

### Things will be able to do with the RAIR token on Ethereum

- Sell RAIR Node NFTs by selling NFTs for ETH
- Sell RAIR into Uniswap or onto other exchanges to presell utlity token functionality

### Things we can only do after phase 3 mainnet

- Use RAIR to pay for token minting services
  - Services will include advanced royalty logic, NFT fund structures, etc
- Use RAIR to pay for buy/sell/transfer services
- Use RAIR to pay node operators for hosting your content (bandwidth, storage, compute etc)

# Current Functional Requirements 

### **Admin Panel**

1. User shall only be able to view Addmedia.JSX if they own the Admin NFT via “adminrights”

Non-Admin view - user only sees buy/sell/transfer NO admin panel

![](./attachments/image-20210226-162857.png)

1. User shall only see IPFS button and Delete button (Delete unpins from IPFS) if Admin NFT is inside store.json and validated by Metamask

![](./attachments/image-20210226-162943.png)

### **Upload Video**

1. User shall be able to login with Metamask server API and upload video only if correct Admin NFT is in their wallet and in Store.json lowdb file
2. User shall have to go through security confirmation for user every time they login with device or IP address. Metamask does this

![](./attachments/image-20210226-163523.png)

### **Watch Video**

1. User shall only be able to watch videos if token in their metamask wallet = token in rair.json encrypted IPFS folder. This happens by signing with Metamask

![](./attachments/image-20210226-163621.png)

# Future Functional Requirements (TODO)

## RAIR Node Setup

Goal: Create automated RAIR node setup UI that performs backend manipulation

Frontend: Create a new panel (demo.rair.tech/setup)

·        UI for .env file creation

o   Input JWT Secret (*we need to swap this out with Oauth eventually – separate project)*

o   Input Admin Control NFT

o   Input Pinata Cloud API Keys

·        Create new store.json blank with only Admin Control NFT information

·        NGINX and other port configurations can troubleshoot via UI multer.js form

·        Reset Node (Deletes store.json and resets node to blank status)

Backend

o   Update .env file

o   Update nginx.conf and other settings required to make the node work properly

o   Update FFMPEG with user specified bitrates

![](./attachments/rairsetup.png)

## iFrame embed all crypto components - VP SOFTWARE TEAM FRONTEND

RAIR is offloading as much onto other blockchain applications as possible to prevent scope crept, and focus on our core value proposition (encrypted streaming). As time and resources allow, we will begin offering our own native blockchain functionality starting with minting/transferring/royalty logic on a faster blockchain (see roadmap)

- Embed Metamask - Instead of a pop up which clutters the experience and focusing - embed metamask directly into the App as a sidebar.
- Embed [Opensea.io](http://Opensea.io) - On each product page, feature the Opensea storefront under the video player
- Embed 3Box - To quickly add social features, embed 3box functionality below Opensea

## Basic video site type functionality - VP SOFTWARE TEAM FRONTEND

Use Hellomirror repo to more quickly create basic video store frontend.

- search by keywords, filters, attributes (can inherit attributes from Opensea et al smart contract)
- sorting (price, newest, etc)
- User shall have X login attempts before timing out
- Read/write to store.json lowdb file for what Frontend displays

![](./attachments/RAIR%20UI%20Gluing%20ETH%20apps%20together%20(3).png)

Components featured in screenshot mashup above

- Metamask
- [RAIR Aamin NFT Demo Store](https://opensea.io/collection/rairadmin/)
- [卞ｅｔｏｎ　（ゖじふ） - RAIR DEMO STORE | OpenSea](https://opensea.io/assets/0x495f947276749ce646f68ac8c248420045cb7b5e/110358287169299991095011843599187509657739820741057412395766409888454196330497)
- [RAIR on 3Box](https://3box.io/0xf3fc93b77a1a39610aa800734dfd017ca293e53d)

## Wodafied backend - VP SOFTWARE TEAM BACKEND

File handling logic

- Upload mp4
- Convert mp4 into .m3u8 and .ts file streaming chunks with FFMPEG
  - currently we only do one bitrate and no subtitles. Need at least a fallback lowres FFMPEG output as well as high res 9000kbs output. Use multer.js to add subtitle files as option.
- Add rair.json descriptor to unencrypted FFMPEG output flolder
- npm rareify to encrypt folder
- upload encrypted folder to Pinata.cloud for backup

Services to WODAify into components

- IPFS - this is the most important component to WODAify as we can also save our Docker images to IPFS to reconstruct a RAIR node from a distributed backup
- Eth Auth
- FFMPEG/HLS

## ETH App Integrations

- User shall able to scrape video information from the verified web pages (Metamask API)
- User shall able to able to Sell Videos to friends by transferring token (Opensea/Rarible/et al)
  - [https://opensea.io/assets/0xd07dc4262bcdbf85190c01c996b4c06a461d2430/50984/transfer](https://opensea.io/assets/0xd07dc4262bcdbf85190c01c996b4c06a461d2430/50984/transfer)
- NFT Owner shall be able to add new videos to the server’s database (Create rair.json IPFS folder)
- NFT Owner shall be able to remove their past videos from the server’s database (IPFS Unpin)
- User shall be able to post Social functions around content. Comment/Wall features. (3[box.io)](http://3box.io/)
  - [https://3box.io/0xf3fc93b77a1a39610aa800734dfd017ca293e53d/wall](https://3box.io/0xf3fc93b77a1a39610aa800734dfd017ca293e53d/wall)

# Non-functional Requirements

### Licensing

Have all rights properly attributed - attain MIT licenses for as many dependencies as possible

[https://etherscan.io/contract-license-types](https://etherscan.io/contract-license-types)

### Characteristics

All good things we want with WODA

- Performance - Response Time, Throughput, Utilization, Static Volumetric
- Scalability
- Capacity
- Availability
- Reliability
- Recoverability
- Maintainability
- Serviceability
- Security

MOST IMPORTANT NON-FUNCTIONAL REQUIREMENT = **SURVIVABILITY**

We want RAIR to work like Bit Torrent where the last node can never be destroyed. If a Docker image goes down we must be able to programmatically generate a new node. Same for the servers, we want RAIR nodes redundant in many places with image files stored on IPFS.

- Goal 1: IPFS Reproducibility: This is the ability to completely recontruct a RAIR node from Docker images and yaml files stored on IPFS. All files must be encrypted and only NFT unlocked.
- Goal 2: Total node level redundancy: This ensures each server can perform all tasks required to run a RAIR node. IPFS daemon, FFMPEG/HLS, and ETH-Auth services installed on every server.
- Goal 3: Task optimized nodes: To make things more efficient, some nodes should specialize in more ASIC type tasks such as encryption/decryption, and video encoding.

People could be posting free speech/anti-censorship content so we need to make sure RAIR nodes can always be accessible regardless of what is trying to stop them. Even if regular DNS refuses to serve requests it should eventually work on Tor/Onion browsers.

1. System must push real time data in at most 10 seconds with a reasonable range connection from the IOS/Android and web application
2. System must secure network connections by encrypting sensitive data using IPFS
3. System must guarantee 99.999% uptime
4. Application must connect to the docker container
5. System must be scalable to the number of NFTs minted. Eg if 10,000 people buy a token to watch a video it should at least support 1000+ simulatenous streams. Can gather data on max simultaneous watch rates.
6. System must be coded in React JS(CSS and Javascript) for the websites application
7. System must authenticate the user within 10 seconds of login
8. System must create a back image of the database every 24 hours

# Design

### Use Case 1: View Video

![](./attachments/Viewing%20Video%20(1).jpg)

| **System** | **RAIR dApp** |
| --- | --- |
| Use Case | Viewing Video |
| Actors | Customer, NFT Owner |
| Description | A Cusomer may request transfer data from the RAIR dApp to general patient record database that is maintained by view video from filter Video and delete Video. The information transferred may either be updated personal nfts(ethAddress,nftid) also include a summary of the videos description. |
| Data | Customer’s personal information, video summary |
| Stimulus | User command issued by Customer |
| Response | Confirmation that Video has been updated |
| Comments | The Customer must have appropriate security permission to access the Video information and view videos, delete videos |

### Use Case 2: Uploading a Video

![](./attachments/Uploading%20an%20Video.jpg)

| **System** | **RAIR dApp** |
| --- | --- |
| Use Case | Accout Registration |
| Actors | NFT Owner, Moderator |
| Description | Admin can approve video for Nft Owner, so it can only view video. Login can for both side. |
| Data | User login (metamask), user password, security questions, public key |
| Stimulus | User submits user login, user password, security question, and public key |
| Responce | If a user submitted his/her user login(), user password, security questions answers. Once the link is clicked and the metamask is confirmed, the account is registered and enabled for activity. |
| Comments | Successfully registered users can buy nft become nft owner. Moderator will auto evaluated for nft owner eligibility. |

| **System** | **RAIR dApp** |
| --- | --- |
| Use Case | Upload an Video |
| Actors | NFT Owner, Moderator, RAIR dApp |
| Description | The Nft owner sends a request to ipload an video to the application database by providing the video along with a brief description, as well as the dates, Prices. a moderator has to manually approve the videos to nft owner. |
| Stimulus | the nft owner requests an video upload through the application |
| Responce | the moderator has to approve owner who don't have video. otherwice, the application cant sends the video information to it’s database. |
| Comments | it’s a fairly normal data upload procedure - a single video may be too low of a standard to not require moderator approval. - server will auto handle(TODO feature) |

### Use Case 3: Finding and registering for videos

![](./attachments/Finding%20and%20registering%20for%20videos%20(1).jpg)

| **System** | **RAIR dApp** |
| --- | --- |
| Use Case | Make offer |
| Actors | Customer, NFT Owner |
| Description | A customer after login into the RAIR and viewing the videos, will have the ability the bookmark videos to one of video on the list after they make offer succesfuly. Before being allowed to make offer in limit time, the application will check against the NFT owner to ensure that the video has not yet been time out. if it has, it will return a message showing that the video is booked. if it has open for sale, it will allow the user to reserve offer |
| Data | nftID customer wants to reserve, # of copy left |
| Stimulus | User command from Customer |
| Responce | Confirmation that user has reserve videos after they make offer success, unless the offer is run of time, in which case the user reserves an error message |
| Comments | This opention will only be available to videos that allows the option to the customer has been success own the nft. |

### Sequence Diagram

### Sequence Diagram 1 - Upload a Video

![](./attachments/Upload%20an%20Video.jpg)

### Sequence 2 - Make an offer

![](./attachments/Make%20Offer.jpg)

### Context Diagram

### The RAIR dApp and its surrounding environment

![](./attachments/Context%20Diagram.jpg)

### Mid- Level Design

### Front End to Mid-Level

![](./attachments/Front%20End%20to%20Mid-Level.jpg)

# Coding

The RAIR applications/website both involve backend and front end coding, In the “Coding” section, we will explain our plans, strategies, and technologies. This will be further divided up by different development, and server approaches. We will explain work delegation and roles for the development of this project.

##   
UML Class Diagrams

![](./attachments/UML%20class%20diagram.jpg)

## Frontend

## Website Development

For our website, we decided to use react as our framework. react has the strongest we need additional libraries that work well with node+ipfs+web3 which helps us integrate. JavaScript will be our base to implement the webpage because JavaScript allows for easier prototyping and deployment. JavaScript is useful here since we can test and deliver prototypes to our clients quickly and efficiently. We will use HTML as our backbone and CSS for decorative elements

## Backend

### Web Server

For our backend development, we will use NodeJS for its extensibility and compatibility. In NodeJS we can perform various data processing and data exchange with our database, as well as implementing other services such as sending confirmation wallets info and hashing sensitive information such as nft token. Since our dApp is using mostly Javascript development NodeJS is easily compatible with the other elements.

### Database Server

We will deploy our backend on lowdb straight into Mainnet of blockchain. We decided on lowdb since our data is mostly secure and simplest already and doesn’t need the flexibility of other fancy database alternatives. We will run Kubernetes as a way to manage and scale our development and database instances. This will run on a vps server to ensure performance. We use OAuth 2.0 standard for encryption and authentication since it is the industry standard for security.

# Testing

## Test Plan

### Testing Process

Testing will be done on several parts of our modules throughout the software engineering process. Development will require automated unit based testing through scripts and other automated input processes. We plan to make our testing as automated as it can.

Phase 1. Database - we will conduct various database testing with automated tools to check for data integrity.

Phase 2. User Interface / User Experience - we will conduct various UI/UX testing both with automated tools and manual testing to confirm front-end functionality.

Phase 3. Firewall - we will be setting up a firewall and conducting ethical tests to ensure information assurance

The phases can be worked on simultaneously to one another, Phase 1 should begin and get most testing done before phase 3 can start since these subsystems are dependent on the database.

### Requirements Testing

All test cases will be linked to a functional or non-functional requirement detailed in the requirements phase of development to ensure that the end product meets its initial requirements  
All testing must be carried out in a timely manner  
All processes should add value to the software life cycle, hence it needs to be effective  
All testing the system exhaustively is impossible hence the testing process needs to be efficient as well  
All testing must provide the overall status of the project, hence it should be manageable

### Test Recording Procedures

We shall record and audit our tests using \[Test Tool here\] on a Git server. A \[Test Tool here\] server will continuously poll for new commits in the Git server and perform automated testing and give feedback to the developers with the test results. When \[Test Tool here\] passes the commit, the results will be passed to quality assurance for random auditing.  

### Testing Tools

Software/Hardware

### End to End Testing

We will conduct testing in each layer and pipeline of software and hardware of our systems such as our database, UI/UX interface, and our firewall. Our goal of our tests is to be made as automated as possible so as to make it possible to work as closely as we can with our development and operational team. We will be conducting end to end testing in the following sequential order:

1. RAIR end to end testing requirement
2. Test Environment setup and hardware/software requirement
3. Describe all the system and its subsystems processes as well as document them
4. Description of roles and responsibilities for all the systems, documenting them, and evaluate for any redundancy
5. Using the appropriate testing methodology and standards end to end requirements tracking and designing of test cases for each appropriate component
6. Validate input and output for each system

### User Acceptance Testing

As our final step, we will be conducting user testing. Our sponsors, once validating user requirements, will be the first set of user acceptance testers to test our release software. We then plan to release it under alpha testing for each new feature where a select member tests the new features of every release. Perhaps, if the situation allows so, we will also make it open to public beta testing. This is all under continuous evolution and maintenance so if any new bugs are to be found, it would be planned to be patched. We will be conducting user acceptance testing fulfilling these sets of criteria:

1. Ensure functional and non-functional requirements will be available to testers
2. Ensure application Code to be fully developed
3. Ensure Unit Testing, Integration Testing, and System Testing to be completed
4. Ensure only Cosmetic error is acceptable before user acceptance testing
5. Ensure all the reported defects should be fixed and tested before user acceptance testing
6. Ensure traceability matrix for all testing to be completed
7. Ensuring our user acceptance testing environment to be ready

### Automated Testing

Git with Jenkins will allow us to maximize automation and allow our development team and operational team to work as closely as possible. Some of our automated tests include the following:

1. Generated lists of valid and invalid login credentials
2. Use a JSON generator to attempt to create multiple nft at once
3. Use an automated tester to attempt to repeatedly add nft to the video

### Test Issues

1. Some test terms may be ahead of others to wait for other terms to complete what they need. This becomes a waste of resources.
2. Due to some form of unknowable incompatibility, the testing tool may not be effective and properly test out test cases.
3. If free resources are allocated to other terms, it may result in the convolution of testing not being performed correctly, because each stage deals with different software and hardware tools.
4. Since the team is independent at each stage, it may lack integration testing.

### Functional Test Cases

ex:

| **Number** | **Name** | **Type/Corresponding Requirement Number** | **Execution** | **Acceptance Criteria** |
| --- | --- | --- | --- | --- |
| FC1 | Logging in with Metamask | Functional 1 | Attempt to login with metamask via google or firefox browser | The user is successful able to login to the RAIR and access all user-leeatures with their metamask account |
|     |     |     |     |     |

# Deployment

### Deployment Plan

Our front-end deployment is fairly straightforward; in fact, our functional and non-functional testing on some select hardware should verify that our web app was correctly deployed into \[[xxxx.com](http://xxxx.com)\]. Our backend deployment, however, is deployed outside the scopes of our hardware. Our lowdb database, servers, and API servers are all deployed externally into docker. For that, we will use dockerized VM, which automates software deployment. Through the VM dockerized code deploy console, we can deploy our web free of charge (using the free tier service) or by using paid services, and it can be done automatically without needing to contact the docker IT administrators.

Interservice communication will be configured through dockerized vm. All our backend services all use k8s infrastructures( lowdb database, servers, and API servers) can be configured directly through dockerized vm. We will use \[REST API\] for Interservice communication in higher-lever applications, which will also work well for the front-end application too because the web app uses HTML 5.

### Waterfall Deployment

Because we are using the waterfall methodology, by the time we reach deployment, we have already completed all our previous deliverables chronically. The project is ready to be deployed and to be passed onto the maintenance team. All the up-to-date requirements, design, implementation, and testing documents are passed onto our deployment team so they understand how the system thus far operates. The deployment team will automate as much of the deployment they can with dockerized k8s VM.

Aside from dockerized k8s VM, we will be installing operating systems on vps, installing security patches, hardening servers, installing Web servers, and installing lowdb.

### Project Deployment

Because we are using the waterfall model, our system will be ready to be deployed upon reaching this phase and preparing to pass the project to the maintenance team. The back-end server will be hosted on lowdb (Z docker image Kubernetes node.js User Database related [1blu.de](http://1blu.de). Vps OAuth 2.0 Authentication and Y docker image node.js- lowdb Video Database port:5000), and the project website will be hosted on HETZNER cloud.

Our deployment team would coordinate with the network and IT management team to finally get the application up and running on the production server. In addition, the project manager/CTO needs to know the scope of the project, the goals, and the tasks necessary to complete the work on time and within the approved budget; check the currently available personnel, the equipment team needs or purchase, and where the team wants to perform the tasks of this project and the available space; use the above criteria to make a list, and then make sure that the list meets the budget allocated for the project, as part of the dependency plan; develop an emergency plan in case team members are blocked or team needs insufficient resources. Avoid relying too heavily on one resource for a deployment plan to avoid trouble.

After deployment, the project is considered completed and the maintenance team will focus on maintaining the application.

### New Version Deployment

With each new version, we need to iterate through our entire waterfall pipeline process before we deploy our new version into docker. We will be using similar automated deployment services like k8s to push any new deployment to docker. Front-end deployment will simply be deployed through the docker Nginx.

### Deployment Recording Procedures

During deployment, we will use an Issue-Action-Decision Log to track all current problems with the deployment. Cases will be listed as open or closed to identify whether the problems have been resolved or not. Open cases will list the issue or problem, the status of the problem (open or closed), the person who reported the problem, the priority of the problem to determine how urgently it needs to be fixed, the due date, and any comments about the actions that should be taken to fix the issue.

We will also record all the decisions made while deployment is underway. We will use a “decision log” to track all decisions made during the deployment process that affect the application. The log will have a description of the decision, the decision that was made, the date the decision was made, any related items, and comments on how and why the decision was made.

We will also use Atlassian to improve productivity management resources and Jira to generate all sorts of reports to give project managers a great overview of how is team’s over-tasked or idle.

### Deployment Tools

#### Software/Hardware

- Kubernetes (k8s) - an open-source container orchestration system for automating computer application deployment, scaling, and management
- lowdb - lowdb is a small local JSON database powered by Lodash (supports Node, Electron, and the browser)
- Docker - a set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers
- Hetzner Cloud - a feature for fast, flexible, and cost-effective (SSD-based) block storage cloud server
- Nginx - a web server that can also be used as a reverse proxy, load balancer, mail proxy, and HTTP cache
- Jira - was designed as a bug and issue tracker. But today, Jira has evolved into a powerful work management tool for all kinds of use cases, from requirements and test case management to agile software development.
- Atlassian confluence -  a collaboration wiki tool used to help teams to collaborate and share knowledge efficiently. With confluence, we can capture project requirements, assign tasks to specific users, and manage several calendars at once with the help of the Team Calendars add-on
- REST API - software architectural style that defines a set of constraints to be used for creating Web services which we will use for interservice back-end communication and front-end communication

### Potential Issues and Resolutions

We are expecting possible potential problems and we will be accounting for as many issues as we can during our deployment phase. Some potential which is not encountered in the developer’s environment can very well occur in the deployment environment. Herein, below, we have listed some potential issues and our resolution to overcome some of these potential issues.

#### Potential Issues

- One could argue that everything can be solved if the team gives it enough time and resources for testing. The counterargument to this is always that the team never has enough time and resources.
- Second, putting in a product lifecycle schedule with one or two weeks set aside for performance testing is really nothing more than performance validation and hoping service-level agreements are met. It gives no time to take any sort of corrective action if issues are found.
- Third, the prior concepts were related to having enough time to meet our project goals. What if those goals aren’t properly defined. Like translating business expectations into hard technical requirements that can be measured by the load test apparatus and performance monitoring tools.
- Last, Test team may fail to observe performance test results.

#### Resolutions

Reviewing how things are working in production; Fixing problems before they’re really problems should be one of those goals that get time and resources allocated to it, though. Also, the schedule needs to be flexible enough to handle problems that occur (including, perhaps, delaying feature launches); Run into for load test having a goal of N users arriving on the system at any given time; last pay attention to the performance test results, or be prepared to live with the consequences.

# Maintenance

## Maintenance Plan

The goal of a maintenance plan is to ensure stable service to the customer without any hiccups and during the maintenance phase, the team will ensure that the application runs smoothly on the server without causing any downtime. All the documents for requirements, design, implementation, testing, and deployment will be passed into this team for their understanding of technologies and tools in this scope of this project. The client will provide ongoing support for any issues that can be found with the help of the development team. This will provide optimal service with a quick response to any issues or bugs found after deployment. The problems reported after going online are fixed by the team and tested by the test team.

## Regular Maintenance

A bi-weekly meeting will be held to address any new issues or bugs found. Also, these meetings will check daily performance, updates, and any future improvements. Daily monitoring will be performed by the maintenance team in case of a system failure or a breach. In case of failure, the maintenance team will be on call to respond as quickly as possible.

## Failure Maintenance

In the case of a failure, the system will go down and be resolved as safely and as soon as possible. This is in the hope to reduce any downtime or financial cost the failure may cause. Failure measures will be in place to prevent customer data from being accessed maliciously. The maintenance team will communicate with the dev team to help facilitate fixes as quickly as possible.

## Perfective Maintenance

Perfective Maintenance will be carried out by a separate maintenance team that is in charge of expanding the functionality of the application after launch. This team’s purpose is to both create new features for use on the application, as well as to ensure that the features are properly tested and functional on the final application.

## Potential Issues

Potential Issues in our maintenance plan include system crashes during maintenance, system failures during times where the maintenance team is not active, and critical bugs being discovered between the biweekly meetings. The plan to resolve these issues is to have a rotating cast of maintenance with at least two members available at all times upon application release to ensure that they can resolve any server failures at any time. There will also be emergency meetings in response to critical bugs, and the maintenance team will store prior versions of the applications in case the application crashes during maintenance.

## Maintenance Recording Procedures

All forms of maintenance done to the application will be stored onto an encrypted text file shared by the maintenance team on an internal server. A copy of this text file is stored in a legacy folder every day that changes are made to guarantee there are accurate recordings of maintenance activities for every day during the cycle. At the end of each two week cycle, all legacy files for that cycle are compressed and the final text file representing that day is stored in the legacy folder. Application versions will be stored in the exact same manner as the text logs.

## Maintenance Resources

Maintenance Teams - We will need a maintenance team composed of the lead architect to ensure the overall system is in maintained as projected, two developers in charge with assisting with the system APIs, and two testers in charge of dealing detecting bugs and critical errors as well as a separate team working on perfective maintenance.

- Jira Ticketing System- proprietary issue tracking product developed by Atlassian that allows bug tracking and agile project management.

## Transition Process

To begin the transition process, the development team must list out the standards the application must hold up to once it enters maintenance, based off of the requirements and design models created in the development process. All the up-to-date requirements, design, implementation, testing, and deployment documents involving tools, technologies, and API such as store.json in backend or docker VM configurations will be passed to our maintenance team. Additionally, the software team should make a documentary about the latest version of the application, as it will help the maintenance team understand how the application functions.

The software team should also make sure they have well-documented code. This will make sure the maintenance team can easily identify any bugs or errors in the code once the application is being maintained.

When the deployment team swaps over to the maintenance team, the team will also have to hand over the tools and their credentials of the project repository to the maintenance team, including switching the permissions for repository access.

Any other technical information related to the project should be provided to the maintenance team.

When our development team members transition the solution to the maintenance team, they must:

- Provide a product overview and all documentation from the requirements/design phases
- Identify the service details of the application and how it interacts with other processes or services
- Establish a connection between the maintenance team and the stakeholders so they can review the application
- Document any bugs or issues still in the system
- Create a system to request and create changes in the application

Provide RAIR overview and documentation; identify the service details and its impact on other processes; services or workflows; document all the relevant findings; establish maintenance status meetings with business partners and IT stakeholders review the performance of the application as per specification; establish production issues and event meetings with product owners and technical teams, the issues and bugs that need immediate action are discussed; communication governance model, which reviewed by the business and IT stakeholders; create change control board and request changes to the application without blocking the maintenance team's intended goals.

The phases of the transfer flow are listed below:  
Phase 1: Find out what information needs to be transferred to the maintenance team  
Phase 2: Consider the logistics, schedules for teams, deployment plan, and scaling  
Phase 3: Make a transition team using staff that specializes in the elements that need to be watched closely by the maintenance team  
Phase 4: Strategize and develop the transition plan  
Phase 5: Identify the risks and their mitigation solution  
Phase 6: Use the transition plan to move the application from development to maintenance

Last but not least, it is necessary to ensure that a comprehensive checklist is established on the basis of the service acceptance standard of each process during the service conversion process, and a mechanism to objectively measure it is established to ensure that each service is properly functional once the product enters the maintenance stage.