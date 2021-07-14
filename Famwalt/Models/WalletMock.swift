//
//  WalletMock.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 12/06/21.
//

enum WalletMock {
    static let ethDemo = Wallet(id: 0, name: "Eth", address: "demo.eth")

    static let ingredientsMock = [
    ethDemo
    ]
        
    static let eth = Chain(id: 1, name: "Ethererum Mainnet")
    static let polygon = Chain(id: 137, name: "Polygon/Matic Mainnet")
    static let bsc = Chain(id: 56, name: "Binance Smart Chain")
    static let avaMain = Chain(id: 43114, name: "Avalanche C-Chain Mainnet")
    static let fujiText = Chain(id: 43113, name: "Fuji C-Chain Testnet")
    static let fantom = Chain(id: 250, name: "Fantom Opera Mainnet")
    static let rskMainnet = Chain(id: 30, name: "RSK Mainnet")
    static let rskTest = Chain(id: 211, name: "RSK Testnet")

    
    static let allChains = [eth, polygon, bsc, avaMain, fujiText, fantom, rskMainnet, rskTest]
    
    static let currency = [Currency(systemName: "dollarsign", name: "USD", sign: "$"),
                           Currency(systemName: "dollarsign", name: "CAD", sign: "$"),
                           Currency(systemName: "eurosign", name: "EUR", sign: "€"),
                           Currency(systemName: "dollarsign", name: "SGD", sign: "$"),
                           Currency(systemName: "indianrupeesign", name: "INR", sign: "₹"),
                           Currency(systemName: "yensign", name: "JPY", sign: "¥"),
                           Currency(systemName: "dongsign", name: "VND", sign: "₫"),
                           Currency(systemName: "yensign", name: "CNY", sign: "¥"),
                           Currency(systemName: "wonsign", name: "KRW", sign: "₩"),
                           Currency(systemName: "rublesign", name: "RUB", sign: "₽"),
                           Currency(systemName: "turkishlirasign", name: "TRY", sign: "₺"),
                           Currency(systemName: "e", name: "ETH", sign: "Ξ"),
    ]
}

