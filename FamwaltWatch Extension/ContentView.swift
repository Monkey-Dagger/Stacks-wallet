//
//  ContentView.swift
//  FamwaltWatch Extension
//
//  Created by Shreyas Papinwar on 23/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tokens(TokenVM: TokenViewModel(chainID: "1", address: "demo.eth", currency: "USD"))
                .tabItem {
                    Text("First")
                }
            TransactionView(TxnVM: TransactionViewModel(chainID: "1", address: "demo.eth", currency: "USD"))
                .tabItem {
                    Text("Second")
                }
            Settings()
                .tabItem {
                    Text("Third")
                }
        }
        .font(.headline)
    }
}
