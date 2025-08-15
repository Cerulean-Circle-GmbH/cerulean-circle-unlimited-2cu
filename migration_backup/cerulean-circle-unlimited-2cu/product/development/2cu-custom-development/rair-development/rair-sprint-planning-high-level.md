# RAIR sprint planning (high level)

|     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- |
|     | Start | End | Frontend | Backend | Smart Contracting | Testing/Deployment |
| ~Sprint 18~ | 3/10/2021 | 3/31/2021 | Deconstruct POC frontend Elements | Deconstruct POC backend elements | Research and Selection + Telos Testing |     |
| ~Sprint 19~ | 3/31/2021 | 4/21/2021 | Select woda IDE as interim frontend | Begin dockerization processes | xDAI, Avalanche Investigation, Begin testnet RPC Marketplace |     |
| ~Sprint 20~ | 4/21/2021 | 5/12/2021 | Replicate POC frontend functionality | Deployable backend with IFPS docker | Testnet RPC Marketplace minting |     |
| ~Sprint 21~ | 5/12/2021 | 6/2/2021 | Marketplace preparation | Begin interim database SSO solution | Begin integration of Testnet Marketplace into core codebase | Jenkins automation begins |
| ~Sprint 22~ | 6/2/2021 | 6/23/2021 | Marketplace implementation (search/sort/buy/sell) | Finalize database SSO solution | Mint on video upload | Jenkins pull request testing automation |
| ~Sprint 23~ | 6/23/2021 | 7/14/2021 | simplified gallery view | Integrate backend with smart contracting | mint and buy logic (react app based) | Jenkins automated deployment |
| ~Sprint 24~ | 7/15/2021 | 8/5/2021 | WODA component based frontend that talks with metamask | Encryption logic that works with BNB | multi network investigation (polygon) and resale logic | Solidity dev environment deployable |
| Sprint 25 | 8/6/2021 | 8/26/2021 | cleaned up REACT minter for prototyping (ticketing focus)<br><br>Strategize cross project whitelabel WODA storefront | Dedicated pinata gateway<br><br>Finalized DB architecture | Investigate differences with Polygon vs BSC/ETH<br><br>resale transfer with royalties | JWT security research<br><br>Minting engine testing |
| Sprint 26 | 8/27/2021 | 9/16/2021 | REACT minter talks with Mongodb instead of blockchain | Finalized endpoint documentation to make frontends hot swappable | push to opensea via API (klaytn or polygon) | JWT security audit (Onpath Ed) |
| Sprint 27 | 9/17/2021 | 10/7/2021 | easy to price, lock, purchase, resell NFTs | push a direct video player via URL link<br><br>(video embed widget) |     | Ready for Kubernetes |
|     |     |     |     |     |     |     |

# MVP Goals

**Key Deliverable**

Upload and streaming functionality via reskinned WODA frontend. Separate minting engine to deploy NFT factory contract with vending machine logic.

**Frontend**

\-Search/sort functionality

\-buy/sell/list functionality

\-Admin control NFT securely unlocks upload panel and unpin features

\-WODA component-based Frontend build

\-Anatassiia’s fancy UI/UX integrated

**Backend**

\-Uploads/converts/encrypts video

\-pins/unpins from IPFS

\-SSO database to manage user session

\-multi-chain support (ETH + BNB) managed via infura equivalent ([Quicknode](https://www.quicknode.com/chains/matic))

**Smart Contracting**

\-Mints token on video upload (erc721 Factory/Collection/NFT)

\-Requires RAIR token to upload (if X RAIR is sent to treasury address → then process upload → else reject upload)

\-Send X RAIR tokens to treasury address and receive 1 admin control NFT (or we can do this manually wallet-to-wallet to start with)

**Testing/Devops**

\-Jenkins testing to ensure uptime/reliability

\-Automated deployment (non-kubernetes)

\-Solidity development environment deployable

## Sprint 24

**UI/UX**

- make upload, minting, and creator functions pretty and useable (hand off final web/mobile/backend design

**frontend**

- automatic network selection and connect (bnb)[https://2cu.atlassian.net/browse/WODA-1981](https://2cu.atlassian.net/browse/WODA-1981)
- support all of features of minting network in frontend. (factory/collection/nft)[https://2cu.atlassian.net/browse/WODA-1982](https://2cu.atlassian.net/browse/WODA-1982)
- finish implementing search/sort/filter
- push new WODA frontend (component based build)
- look nice (css theme overlay)[https://2cu.atlassian.net/browse/WODA-1983](https://2cu.atlassian.net/browse/WODA-1983)
- custom URLs (using woda hooks)[https://2cu.atlassian.net/browse/WODA-1984](https://2cu.atlassian.net/browse/WODA-1984)

**backend**

- verify encryption process
- document and understand encryption process
- more secure JWT secret implementation (cycle them instead of static)
- field in json schema for supported EVM networks (eth, bnb, polygon, etc)
- get our own tokens sent to npm rareify
- fix delete functionality
- integrate with NFT collection architecture
- make sure json schema can handle minting network logic

BNB subtasks

- confirm infura works with BNB
- make sure backend works with other blockchains (bnb)
- confirm encryption works on BNB

**smart contracts**

- test if smart contract code works with new network (polygon/klaytn for Opensea support)
- finish resale logic
- non sequential purchases (0x:0 for $10,000 0x:9 for $500 etc)

**testing**

- manual testing
- Begin integration with jenkins
- Investigate Selenium or similar standard testing frameworks
- Begin implementation of selenium or similar
- Investigate Ethereum testing tools
- Begin implementation of Ethereum testing tools.

**devops**

- switch out admin/password with better security
- add proxy into deployment (dev.rair.tech)
- create easily deployable solidity environment
- Create pipeline for CI of stable releases to demo, deployment, and QA servers.
- Begin investigation of Kuberenetes.