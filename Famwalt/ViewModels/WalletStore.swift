//
//  WalletStore.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 12/06/21.
//

import Foundation
import RealmSwift

final class WalletStore: ObservableObject {
    private var walletResults: Results<WalletDB>
    var selection: Int
    
    var chain: Int
    
    let userDefaults = UserDefaults()
    
    var currency: String
    
    init(realm: Realm) {
        walletResults = realm.objects(WalletDB.self)
        selection = userDefaults.value(forKey: "selection") as? Int ?? 0
        
        chain = userDefaults.value(forKey: "chain") as? Int ?? 1
        currency = userDefaults.value(forKey: "currency") as? String ?? "USD"
    }
    
    var wallets: [Wallet] {
      walletResults.map(Wallet.init)
    }
}

// MARK: - CRUD Actions
extension WalletStore {
    func create(name: String, address: String) {
        objectWillChange.send()
      
        do {
            let realm = try Realm()

            let walletDB = WalletDB()
            walletDB.id = UUID().hashValue
            walletDB.name = name
            walletDB.address = address
            
            try realm.write {
              realm.add(walletDB)
            }

        } catch let error {
            // Handle error
            print(error.localizedDescription)
        }
    }

    func update(walletID: Int, name: String, address: String) {
        objectWillChange.send()
        do {
          let realm = try Realm()
          try realm.write {
            realm.create(
              WalletDB.self,
              value: [
                "id": walletID,
                "name": name,
                "address": address,
              ],
              update: .modified)
          }
        } catch let error {
          // Handle error
          print(error.localizedDescription)
        }
    }

    func delete(walletID: Int) {
        objectWillChange.send()
        
        guard let walletDB = walletResults.first(
          where: { $0.id == walletID })
          else { return }

        do {
          let realm = try Realm()
          try realm.write {
            realm.delete(walletDB)
          }
        } catch let error {
          // Handle error
          print(error.localizedDescription)
        }
    }
    
    func select(id: Int) {
        objectWillChange.send()
        userDefaults.set(id, forKey: "selection")
        selection = id
    }
    
    func changeChin(id: Int) {
        objectWillChange.send()
        userDefaults.set(id, forKey: "chain")
        chain = id
    }
    
    func changeCurrency(currency: String) {
        objectWillChange.send()
        userDefaults.set(currency, forKey: "currency")
        self.currency = currency
    }
}

