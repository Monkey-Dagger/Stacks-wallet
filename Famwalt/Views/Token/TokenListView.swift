//
//  TokenListView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 14/06/21.
//

import SwiftUI

struct TokenListView: View {
    @EnvironmentObject var store: WalletStore
    @State var currencyFormIsPresented: Bool = false

    let tokens: [TokenBalance]
        

    var body: some View {
        List {
            ForEach(tokens) { token in
                TokenRow(token: token)
            }
        }
    }
}

