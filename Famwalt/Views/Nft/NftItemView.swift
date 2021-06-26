//
//  NftItemView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 15/06/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NftItemView: View {
    let nft: Nft
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                Color(colorScheme == .dark ? .white : .black)
                    .opacity(0.05)
                VStack(alignment: .center) {
                    WebImage(url: URL(string: nft.image_url ?? ""))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width * 0.80)
                        .padding(.top)
                    
                    Spacer()

                    HStack(alignment: .center) {
 
                        Text(nft.contract_ticker_symbol!)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                    .padding(.bottom)
                }
            }
            
        }
    }
}
