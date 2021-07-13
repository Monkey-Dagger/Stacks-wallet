//
//  ChainForm.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 14/06/21.
//

import SwiftUI

struct ChainFormView: View {
    @State private var selection: Chain?
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: WalletStore
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.04703966528, green: 0.1053452119, blue: 0.2279646695, alpha: 1))
                .ignoresSafeArea()
            NavigationView {
                ScrollView {
                    ForEach(WalletMock.allChains, id: \.self) { chain in
                        Button(action: {select(chain: chain)}) {
                            ZStack {
                                Color(#colorLiteral(red: 0.08705473691, green: 0.1447888017, blue: 0.2676061988, alpha: 1))
                                HStack {
                                    Text(chain.name)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(#colorLiteral(red: 0.9620503783, green: 0.7937940955, blue: 0.7882629037, alpha: 1)))
                                        .padding(.leading)
                                    Spacer()
                                }
                                .padding(.vertical)
                            }
                            .cornerRadius(10)
                            .padding(.horizontal, 10)
                        }
                    }
                    .padding(.top)
                }
                .navigationTitle("Chain Selection")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
       
    }
}

extension ChainFormView {
    func select(chain: Chain) {
        selection = chain
        store.changeChin(id: chain.id)
        presentationMode.wrappedValue.dismiss()
    }
}

struct ChainForm_Previews: PreviewProvider {
    static var previews: some View {
        ChainFormView()
    }
}
