//
//  TransactionDetailView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 23/06/21.
//

import SwiftUI

struct TransactionDetailView: View {
    var transaction: Transaction
    
    var body: some View {
        List {
            ListItemView(left: "From", right: transaction.from_address ?? "")
            ListItemView(left: "To", right: transaction.to_address ?? "")
            ListItemView(left: "Amount", right: String(transaction.amount ?? 0.0) )
            ListItemView(left: "Quote", right: String(transaction.amount_in_quote ?? 0.0) )
            ListItemView(left: "Gas offered", right: String(transaction.gas_offered ?? 0.0) )
            ListItemView(left: "Gas spent", right: String(transaction.gas_spent ?? 0.0) )
            ListItemView(left: "Gas rate quote", right: String(transaction.gas_rate_quote ?? 0.0) )
            ListItemView(left: "Gas spent quote", right: String(transaction.gas_spent_quote ?? 0.0) )
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct ListItemView: View {
    let left: String
    let right: String
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                Text(left)
                    .frame(width: geo.size.width * 0.50, alignment: .leading)
                Spacer()
                Text(right)
                    .lineLimit(5)

            }
        }

    }
}
