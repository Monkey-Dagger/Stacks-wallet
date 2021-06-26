//
//  NftGridView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 15/06/21.
//

import SwiftUI

struct NftGridView: View {
    
    let nfts: [Nft]
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geo in
            LazyVGrid(columns: gridItemLayout) {
                ForEach(nfts) { nft in
                    NftItemView(nft: nft)
                        .frame(width: geo.size.width * 0.45, height: geo.size.width * 0.60)
                }
            }
        }
    }
}
