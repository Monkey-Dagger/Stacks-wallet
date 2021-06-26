//
//  WalletForm.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 12/06/21.
//

import Foundation

class WalletForm: ObservableObject {
  @Published var name = ""
  @Published var address = ""
  var walletID: Int?

  var updating: Bool {
      walletID != nil
  }

  init() { }

  init(_ wallet: Wallet) {
    name = wallet.name
    address = wallet.address
    walletID = wallet.id
  }
}
