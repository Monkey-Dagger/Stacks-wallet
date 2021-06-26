//
//  NetworkView.swift
//  FamwaltWatch Extension
//
//  Created by Shreyas Papinwar on 24/06/21.
//

import SwiftUI

struct NetworkView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        List {

            item(text: "Ethereum Mainnet")
            item(text: "Polygon Mainnet")
            item(text: "Polygon Mumbai Testnet")
            item(text: "Binance Smart Chain")

            item(text: "Avalanche C-Chain Mainnet")

            item(text: "Fantom Opera Mainnet")

        }
    }
}

struct item: View {
    @Environment(\.presentationMode) var presentationMode
    var text: String
    var body: some View {
        Button(action: { presentationMode.wrappedValue.dismiss() }, label: {
            Text(text)
        })
    }
}

struct NetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkView()
    }
}
