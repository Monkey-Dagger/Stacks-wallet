# Stacks-wallet

SwiftUI based iOS and watchOS app for querying blockchain data via the Covalent API. I made wallet app for listing token balances, NFTs and searching for transactions on a perticular wallet network and address.

## TestFlight - Testing iOS and watchOS app.

https://testflight.apple.com/join/C4Ffdyd0

## Screenshots

![Stack-ios](https://raw.githubusercontent.com/shreyaspapi/Stacks-wallet/main/images/ios1.png)
![Stack-ios](https://raw.githubusercontent.com/shreyaspapi/Stacks-wallet/main/images/ios2.png)
![Stack-ios](https://raw.githubusercontent.com/shreyaspapi/Stacks-wallet/main/images/watchos.png)

## Currently the wallet supports:

### Mainnets
- Ethereum	1
- Polygon/Matic	137
- Avalanche C-Chain	43114
- Binance Smart Chain	56
- Fantom Opera	250

### Testnets
- Polygon/Matic Mumbai	80001
- Fuji C-Chain	43113
- Kovan	42
- Binance Smart Chain	97
- Fantom	4002


Feedback and suggestions: https://shreyasp.me

Features:
- fetch and filter token balances
- get NFT data
- Smart contract transaction info

App architecture:
- MVVM design

Remaining (watchOS):
- Add navigation to transactions to show complete transaction details we get from covalent.
- Selection of multiple addresses is not complete due to hackathon as this was my first time making a watchOS app using swiftUI.
