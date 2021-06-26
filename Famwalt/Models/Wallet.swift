//
//  Wallet.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 12/06/21.
//

struct Wallet: Identifiable {
  let id: Int
  let name: String
  let address: String
}

// MARK: Convenience init
extension Wallet {
  init(WalletDB: WalletDB) {
    id = WalletDB.id
    name = WalletDB.name
    address = WalletDB.address
  }
}
