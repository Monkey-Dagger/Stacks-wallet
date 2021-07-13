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
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.leading, 5)
            
            VStack(alignment: .leading) {
                Text(token.contract_ticker_symbol!)
                    .font(.title3)
                    .foregroundColor(Color(#colorLiteral(red: 0.9581345916, green: 0.7898219228, blue: 0.7886767983, alpha: 1)))
                Text(token.contract_name!)
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 0.9581345916, green: 0.7898219228, blue: 0.7886767983, alpha: 1)))
            }
            .padding(.leading, 7)

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
        .padding(.leading, 4)
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
