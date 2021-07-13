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
                Color(#colorLiteral(red: 0.08705473691, green: 0.1447888017, blue: 0.2676061988, alpha: 1))
                HStack(alignment: .top) {
                    WebImage(url: URL(string: nft.image_url ?? ""))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width * 0.24)
                        .cornerRadius(10)

                    VStack(alignment: .leading) {
                        Text(nft.contract_ticker_symbol!)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.9581345916, green: 0.7898219228, blue: 0.7886767983, alpha: 1)))
                            .font(.system(size: 15))
                            .lineLimit(1)
                            .truncationMode(.tail)
                        
                        Text(nft.description!)
                            .font(.system(size: 10))
                            .foregroundColor(Color(#colorLiteral(red: 0.9581345916, green: 0.7898219228, blue: 0.7886767983, alpha: 1)))
                            .padding(.top, 3)
                            
                    }
                    .padding(.leading, 5)
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
            }
            
        }
    }
}
