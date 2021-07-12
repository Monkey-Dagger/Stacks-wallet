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
        
        ZStack {
            Color(#colorLiteral(red: 0.04703966528, green: 0.1053452119, blue: 0.2279646695, alpha: 1))
            GeometryReader { geo in
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                    
                        HStack(alignment: .center) {
                            WebImage(url: URL(string: nft.image_url ?? ""))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(width: geo.size.width)
                        
                        VStack(alignment: .leading) {
                            Text(nft.name!)
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 0.9620503783, green: 0.7937940955, blue: 0.7882629037, alpha: 1)))
                                .font(.title3)
                                .padding(.top, 10)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    
                                    Text(nft.owner!)
                                        .font(.system(size: 10))
                                        .foregroundColor(Color(#colorLiteral(red: 0.9620503783, green: 0.7937940955, blue: 0.7882629037, alpha: 1)))
                                }
                                Spacer()
                                Text("ID: \(nft.token_id!)")
                                    .font(.system(size: 10))
                                    .foregroundColor(Color(#colorLiteral(red: 0.9620503783, green: 0.7937940955, blue: 0.7882629037, alpha: 1)))
                            }
                            .padding(.top, 4)
                            
                            Text("Description")
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 0.9620503783, green: 0.7937940955, blue: 0.7882629037, alpha: 1)))
                                .padding(.top)
                            
                            Text(nft.description!)
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(#colorLiteral(red: 0.9620503783, green: 0.7937940955, blue: 0.7882629037, alpha: 1)))
                                .lineLimit(1000)
                                .foregroundColor(.gray)
                                .padding(.top, 3)
                        }
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        
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
}

