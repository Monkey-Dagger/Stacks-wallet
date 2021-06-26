//
//  WalletListView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 12/06/21.
//

import SwiftUI

struct WalletListView: View {
    @EnvironmentObject var store: WalletStore
    @State var walletFormIsPresented: Bool = false

    let wallets: [Wallet]
        

    var body: some View {
        List {
            ForEach(wallets) { wallet in
                WalletRow(wallet: wallet)
            }
        }
    }
}


struct WalletListView_Previews: PreviewProvider {
    static var previews: some View {
        WalletListView(wallets: [Wallet(id: 0, name: "temp", address: "demo.eth")])
    }
}
