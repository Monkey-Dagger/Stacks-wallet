//
//  NftDetailView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 15/06/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NftDetailView: View {
    let nft: Nft
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                
                    HStack(alignment: .center) {
                        Spacer()
                        WebImage(url: URL(string: nft.image_url ?? ""))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.70)
                            .cornerRadius(15)
                        Spacer()
                    }
                    .padding(.top, 8)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(nft.owner!)
                                .font(.system(size: 10))
                        }
                        Spacer()
                        Text("ID: \(nft.token_id!)")
                            .font(.system(size: 10))
                    }
                    .padding(.horizontal, geo.size.width * 0.05)
                    
                    Text(nft.name!)
                        .font(.title2)
                        .padding(.horizontal, geo.size.width * 0.05)
                        .padding(.top, 5)
                    
                    Text(nft.description!)
                        .font(.body)
                        .lineLimit(1000)
                        .foregroundColor(.gray)
                        .padding(.horizontal, geo.size.width * 0.05)
                        .padding(.top, 3)
                }
                
            }
            
            .navigationTitle("NFT Detail")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Link(destination: URL(string: nft.external_url ?? "https://google.co.in")!) {
                Image(systemName: "link.circle.fill")
            })
        }
    }
}

