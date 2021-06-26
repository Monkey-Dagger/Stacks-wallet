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
        NavigationView {
            List(WalletMock.allChains, id: \.self, selection: $selection) { chain in
                Button(action: {select(chain: chain)}) {
                    HStack {
                        Text(chain.name)
                        Spacer()
                        if selection == chain {
                            Image(systemName: "circle.fill")
                        } else {
                            Image(systemName: "circle")
                        }
                    }
                }
                
            }
            .navigationTitle("Chain Selection")
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
