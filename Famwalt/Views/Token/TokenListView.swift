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
    let balance: Double

    var body: some View {
        VStack {
            ScrollView {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.08705473691, green: 0.1447888017, blue: 0.2676061988, alpha: 1)))
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                    
                    VStack {
                        Text("TOTAL BALANCE")
                            .font(.system(size: 13))
                            .fontWeight(.semibold)
                            .padding(.bottom, 5)
                            .foregroundColor(Color(#colorLiteral(red: 0.9581345916, green: 0.7898219228, blue: 0.7886767983, alpha: 1)))
                        
                        Text("$ \(balance)")
                            .fontWeight(.bold)
                            .font(.subheadline)
                    }
                    .padding()
                }
                .padding(.top)
                
                HStack {
                    Text("Tokens")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .padding(.top)
                        .foregroundColor(Color(#colorLiteral(red: 0.9581345916, green: 0.7898219228, blue: 0.7886767983, alpha: 1)))
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                ForEach(tokens) { token in
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(#colorLiteral(red: 0.08705473691, green: 0.1447888017, blue: 0.2676061988, alpha: 1)))
                            .cornerRadius(10)
                            .padding(.horizontal, 10)
                        TokenRow(token: token)
                            .padding(.horizontal)
                    }
                    .padding(.top, 3)
                }
            }
        }
    }
}

