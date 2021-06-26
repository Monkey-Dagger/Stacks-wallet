//
//  WalletView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 12/06/21.
//

import SwiftUI

struct WalletView: View {
    @EnvironmentObject var store: WalletStore
    @State private var walletFormIsPresented = false
    @State private var chainFormIsPresented = false
    
    var body: some View {
        NavigationView {
            WalletListView(wallets: store.wallets)
                .navigationBarTitle("Addresses")
                .navigationBarItems(
                    leading: Button(action: toggleChainForm) {
                        ChainView(text: getChainText())
                },
                    trailing: Button(action: toggleWalletForm) {
                    Image(systemName: "plus.circle")
                })
                .sheet(isPresented: $walletFormIsPresented) {
                    WalletFormView(form: WalletForm())
                        .environmentObject(self.store)
                }
        }
        .sheet(isPresented: $chainFormIsPresented) {
            ChainFormView()
                .environmentObject(self.store)
        }
        
    }
}

extension WalletView {
    func toggleChainForm() {
        chainFormIsPresented.toggle()
    }
    
    func toggleWalletForm() {
        walletFormIsPresented.toggle()
    }

    func getChainText() -> String {
        switch store.chain {
        case 1:
            return "Ethereum"
        case 137:
            return "Polygon"
        case 80001:
            return "Polygon Testnet"
        case 56:
            return "BSC"
        case 43114:
            return "Avalanche C-Chain Mainnet"
        case 43113:
            return "Fuji C-Chain Testnet"
        case 250:
            return "Fantom Opera Mainnet"
        default:
            return "Ethereum"
        }
    }
}


struct ChainView: View {
    var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.blue)
                .opacity(0.3)
            Text(text)
                .foregroundColor(.blue)
                .padding(5)
        }
    }
}
