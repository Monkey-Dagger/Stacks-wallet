//
//  TokenRow.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 14/06/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct TokenRow: View {
    @EnvironmentObject var store: WalletStore
    let token : TokenBalance
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: token.logo_url ?? ""))
                .resizable()
                .frame(width: 35, height: 35)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(token.contract_ticker_symbol!)
                    .font(.title3)
                Text(token.contract_name!)
                    .font(.subheadline)
            }
            .padding(.leading, 5)

            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(getCurrency())\(String(format: "%.0f", token.amount!))")
                    .fontWeight(.semibold)
                Text("\(String(format: "%.2f", token.balance!))")
                    .font(.caption)
            }
            .padding(.trailing)
        }
        .padding(.vertical)
    }
}

extension TokenRow {
    func getCurrency() -> String {
        for cur in WalletMock.currency {
            if cur.name == store.currency {
                return cur.sign
            }
        }
        return "$"
    }
}
