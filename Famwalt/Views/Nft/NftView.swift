//
//  NftView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 14/06/21.
//

import SwiftUI

struct NftView: View {
    @EnvironmentObject var store: WalletStore
    @ObservedObject var nftVM: NftViewModel
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geo in
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.fixed(geo.size.width * 0.48)), GridItem(.fixed(geo.size.width * 0.48))]) {
                        ForEach(nftVM.nfts) { nft in 
                            
                            NavigationLink(destination: NftDetailView(nft: nft)) {
                                NftItemView(nft: nft)
                                    .frame(height: geo.size.width * 0.60)
                                    .cornerRadius(15)
                                    .padding(geo.size.width * 0.02)
                                    
                            }
                            
                        }
                    }
                }
                .navigationBarTitle("NFTs")
            
        }
        
    }
}

