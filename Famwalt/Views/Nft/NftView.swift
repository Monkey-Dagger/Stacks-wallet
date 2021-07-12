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
        
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                HStack {
                    Text("Your NFT's")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .padding(.top)
                        .foregroundColor(Color(#colorLiteral(red: 0.9581345916, green: 0.7898219228, blue: 0.7886767983, alpha: 1)))
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                ForEach(nftVM.nfts) { nft in
                    
                    NavigationLink(destination: NftDetailView(nft: nft)) {
                        NftItemView(nft: nft)
                            .cornerRadius(15)
                            .frame(height: geo.size.width * 0.28)
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 5)
                    
                }
                
            }
            .navigationBarTitle("NFTs")
            
        }
        
    }
}

