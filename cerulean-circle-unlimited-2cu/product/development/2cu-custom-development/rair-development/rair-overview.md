# RAIR Overview

![](./attachments/RAIR%20Map.png)

The RAIR system focuses on the encryption of media using Non-Fungible Tokens (NFT) from the blockchain. The backend focuses on the encryption and decryption of the media while the WODA client takes care of the user experience, media display and authentication of the users. Additionally, the blockchain also holds information about NFT ownership and can create and resell NFTs.

# WODA Client (Frontend)

User authentication and connection to the system happens on the frontend with the aid of Metamask / Nifty Wallet, both are clients that connect to the blockchain and can send and receive information.

![](./attachments/Frontend%20Map.png)

For the media encryption the purpose of Metamask / Nifty is getting the user’s wallet address, for media decryption they’re used as authenticators, requiring the user to sign a message to prove their identity on the backend.

For the NFT side of the system, Metamask / Nifty would send transactions for buying, selling, bidding and minting tokens straight from the frontend.

# Encryption (Backend)

![](./attachments/Encryption%20Map.png)

On the backend, the node receives a video file and converts it into a sequence of HLS chunks which are then encrypted with RARIFY using a ***randomly generated decryption key*** independent of any input, the encrypted chunks are stored on IPFS and the decryption key is stored on the database, lastly, the NFT provided by the user is associated with the decryption key.

# Decryption (Backend)

![](./attachments/Decryption%20Map.png)

For media decryption the entire system is involved. The frontend client calls the backend with the Media’s ID and a signed message from Metamask / Nifty, with this information the backend can fetch the information about the media and get the NFT address, number and blockchain. Decrypting the signed message we can get the address of the user trying to unlock the media. After that the backend can connect to the blockchain, ask the ERC721 address if that specific wallet address is the owner of that specific NFT token. If the address owns the token, the backend uses the decryption key to decrypt the chunks from IPFS and send them to the WODA Client.

# RAIR ERC721s (Blockchain)

The frontend and backend can work with all kinds of blockchains and NFTs, but the main appeal of using RAIR NFTs is the royalty fees given to creators on every sale and resale, which is what the NFT Marketplace and factory are for.

## ERC721s

Is a standardized contract that follows the [EIP-721](https://eips.ethereum.org/EIPS/eip-721) guidelines, their main purpose is to handle non fungible tokens (NFTs), so each token is unique and is identified by a number. Ideally each creator has a different ERC721 contract which they own, this gives them complete freedom on the number of tokens they assign or how they transfer them around.

## RAIR’s ERC721

The RAIR version of the ERC721 keeps the same standard features but adds new ones, like holding the wallet address of the creator and their royalty fee. The royalty uses the [EIP-2981](https://eips.ethereum.org/EIPS/eip-2981) guidelines so other marketplaces can sell the tokens and still give the creator the royalty fee. Lastly, RAIR ERC721s don’t work with single tokens, they work with collections.

### Collections

The encryption and decryption system works for a single NFT, a collection is simply a group of NFTs. If a media is encoded to a collection instead of a single NFT, all of the NFTs in that collection can unlock the media file. The changes to the decryption system would be minimal, instead of asking if the user owns a token, the backend would have to ask if the user owns one of the tokens inside that collection.

A collection stores their starting and ending points withing the contract’s ID numbers, so a collection that holds 100 NFTs starting at token #412 includes all tokens from #412 to #511, internally though, #412 is #1 of that collection, #413 is #2 and so on.

Keep in mind defining a collection costs gas and (because of their sequential nature) a collection’s limits cannot be modified.

![](./attachments/RAIR%20ERC721%20Map.png)

## Factory

To give each creator a RAIR ERC721 they must use a factory, the factory accepts a certain amount of [ERC777 Tokens](https://eips.ethereum.org/EIPS/eip-777) and deploys a new ERC721 contract with the user as their owner. The number of tokens required to deploy an ERC721 is configurable, and more than one ERC777 token can be accepted (with different amounts for each)

![](./attachments/Factory%20Map.png)

## Minter Marketplace

Deployed ERC721s start with 0 tokens, even if the creator defines a collection. The minter marketplace is a separate contract that is given the permission to call a “mint“ function inside the ERC721 and is given, the minter marketplace then accepts Ethereum or BNB funds and trades them for ERC721 tokens. The price of each token is given by the creator. On every sale the ETH or BNB funds are split between the creator (90%), the node (1%) and the RAIR treasury (9%).

### Lazy Minting

As soon as the creator defines a collection they can start locking media behind them, however, the tokens within that collection aren’t minted yet. With the minter marketplace the creator puts the collection up for sale and the end user is the one that pays the gas to actually mint the token.

![](./attachments/Minting%20Map.png)

## Resale Marketplace

Once a token is minted the end user might decide to resell their token, this is done through a different process than the minting marketplace and is a more “traditional“ ERC721 marketplace. For this the end user has to allow the Resale Marketplace to do transfers on their behalf and notify the marketplace that they’ve put a token up for sale (and specify a price). The marketplace will then receive funds and do the trade automatically once another user buys the token and pays the funds requested. The funds will be split 30% for the creator, 60% for the seller, 9% to RAIR and 1% to the Node

![](./attachments/Resale%20Marketplace.png)

## Auction Marketplace (not planned for this sprint)

Similar to the Resale Marketplace but the trade would happen after a specific amount of time, with the highest bidder getting the ERC721 token and paying the transfer.