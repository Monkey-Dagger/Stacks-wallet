//
//  ContentView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 12/06/21.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @EnvironmentObject var store: WalletStore
    
    init() {
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.04703966528, green: 0.1053452119, blue: 0.2279646695, alpha: 1)
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.04703966528, green: 0.1053452119, blue: 0.2279646695, alpha: 1)
    }
    
    var body: some View {
        
        TabView {
            TokenView(tokenVM: TokenViewModel(chainID: String(store.chain), address: getAddress(), currency: store.currency),
                      nftVM: NftViewModel(chainID: String(store.chain), address: getAddress()),
                      txnVM: TransactionViewModel(chainID: String(store.chain), address: getAddress(), currency: store.currency))
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            WalletView()
                .tabItem {
                    Label("Addresses", systemImage: "tray.full.fill")
                }
        }
    }
}


extension ContentView {
    func getAddress() -> String {
        for wallet in store.wallets {
            
            if wallet.id == store.selection {
                return wallet.address
            }
        }
        
        return ""
    }
}
