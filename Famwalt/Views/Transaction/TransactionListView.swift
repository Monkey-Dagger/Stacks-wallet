//
//  TransactionListView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 23/06/21.
//

import SwiftUI

struct TransactionListView: View {
    @ObservedObject var txnVM: TransactionViewModel
    
    var body: some View {
        ScrollView {
            ForEach(txnVM.txns) { transaction in
                NavigationLink(destination: TransactionDetailView(transaction: transaction)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(#colorLiteral(red: 0.1356062591, green: 0.1453753412, blue: 0.1495241225, alpha: 1)))
                        HStack {
                            Text(transaction.from_address!)
                                .truncationMode(.middle)
                                .lineLimit(1)
                                .foregroundColor(.white)
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(transaction.success! ? .green : .red)
                                .frame(width: 30)
                            Text(transaction.to_address!)
                                .truncationMode(.middle)
                                .lineLimit(1)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    .frame(height: 60)
                    .cornerRadius(10)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                }
            }
        }
    }
}

