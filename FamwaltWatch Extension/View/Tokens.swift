//
//  Tokens.swift
//  FamwaltWatch Extension
//
//  Created by Shreyas Papinwar on 24/06/21.
//

import SwiftUI

struct Tokens: View {
    @ObservedObject var TokenVM: TokenViewModel
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                List {
                    ForEach(TokenVM.tokens) { token in
                        TokenItemView(token: token)
                            .padding(.vertical)
                    }
                }
                .navigationTitle("Tokens")
            }
        }
    }
}

struct TokenItemView: View {
    var token: TokenBalance
    var body: some View {
        VStack {

            HStack {
                Text("\(String(format: "%.2f", token.amount!)) \(token.contract_ticker_symbol!)")
                    .font(.subheadline)
                Spacer()
            }
            HStack {
                
                Text("$ \(String(format: "%.2f", token.balance!))")
                    .font(.body)
                Spacer()
                RemoteImage(url: token.logo_url ?? "")
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
            }
        }
    }
}
