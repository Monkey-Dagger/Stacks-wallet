//
//  TokenView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 14/06/21.
//

import SwiftUI

struct TokenView: View {
    @EnvironmentObject var store: WalletStore
    @State private var currencyFormIsPresented = false
    @ObservedObject var tokenVM: TokenViewModel
    @ObservedObject var nftVM: NftViewModel
    @ObservedObject var txnVM: TransactionViewModel
    
    @State private var picker: Int = 0
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.04703966528, green: 0.1053452119, blue: 0.2279646695, alpha: 1))
                    .ignoresSafeArea()
                
                if picker == 0 {
                    TokenListView(tokens: tokenVM.tokens, balance: tokenVM.totalBalance)
                } else if picker == 1 {
                    NftView(nftVM: nftVM)
                } else {
                    TransactionView(txnVM: txnVM)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker("Select", selection: $picker) {
                        Text("Token").tag(0)
                        Text("Nft").tag(1)
                        Text("Transactions").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

