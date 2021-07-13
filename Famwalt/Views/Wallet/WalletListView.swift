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
        ZStack {
            Color(#colorLiteral(red: 0.04703966528, green: 0.1053452119, blue: 0.2279646695, alpha: 1))
            ScrollView {
                HStack {
                    Text("Tokens")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .padding(.top)
                        .foregroundColor(Color(#colorLiteral(red: 0.9581345916, green: 0.7898219228, blue: 0.7886767983, alpha: 1)))
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                ForEach(wallets) { wallet in
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(#colorLiteral(red: 0.08705473691, green: 0.1447888017, blue: 0.2676061988, alpha: 1)))
                            .cornerRadius(15)
                        WalletRow(wallet: wallet)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
        
    }
}


struct WalletListView_Previews: PreviewProvider {
    static var previews: some View {
        WalletListView(wallets: [Wallet(id: 0, name: "temp", address: "demo.eth")])
    }
}
