//
//  WalletRow.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 12/06/21.
//

import SwiftUI

struct WalletRow: View {
    @EnvironmentObject var store: WalletStore
    let wallet : Wallet
    
    @State private var showingOptions = false
    @State private var walletFormIsPresented = false

    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(wallet.id == store.selection ? .green : .red)
                    .padding(.trailing)
                    
                
                Button(action: showOption) {
                    VStack(alignment: .leading) {
                        Text(wallet.name)
                            .font(.title)

                        Text(wallet.address)
                            .font(.subheadline)
                            .truncationMode(.middle)

                    }
                }
                .actionSheet(isPresented: $showingOptions) {
                    ActionSheet(title: Text("Select action"), buttons: [
                        .default(Text("Select")) { selectWallet() },
                        .default(Text("Update")) { walletFormIsPresented = true },
                        .default(Text("Delete")) { delete() },
                        .cancel()
                    ])
                }
                
                .sheet(isPresented: $walletFormIsPresented) {
                  WalletFormView(form: WalletForm(wallet))
                    .environmentObject(self.store)
                }

                Spacer()
                
                
                
            }
        }
    }
}

extension WalletRow {
    func selectWallet() {
        store.select(id: wallet.id)
    }
    
    func delete() {
        store.delete(walletID: wallet.id)
    }
    
    func showOption() {
        showingOptions = true
    }
    
}
