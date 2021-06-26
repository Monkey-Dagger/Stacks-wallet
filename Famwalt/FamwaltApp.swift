//
//  FamwaltApp.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 12/06/21.
//

import SwiftUI
import RealmSwift

@main
struct FamwaltApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(WalletStore(realm: setupRealm()))
        }
    }
}

private extension FamwaltApp {
    func setupRealm() -> Realm {
        do {
            let realm = try Realm()
            
            return realm
        } catch let error {
            fatalError("Failed to open Realm. Error: \(error.localizedDescription)")
        }
    }
}
