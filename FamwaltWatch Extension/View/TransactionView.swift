//
//  TransactionView.swift
//  FamwaltWatch Extension
//
//  Created by Shreyas Papinwar on 24/06/21.
//

import SwiftUI

struct TransactionView: View {
    @ObservedObject var TxnVM: TransactionViewModel
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                List {
                    ForEach(TxnVM.txns) { txn in
                        txnViewItem(tnx: txn)
                    }
                }
                .navigationTitle("Transactions")
            }
        }
    }
}

struct txnViewItem: View {
    var tnx: Transaction
    var body: some View {
        VStack {
            HStack {
                Text(tnx.from_address!)
                    .lineLimit(1)
                    .truncationMode(.middle)
                Image(systemName: "arrow.right.circle.fill")
                
                Text(tnx.to_address!)
                    .lineLimit(1)
                    .truncationMode(.middle)
            }
            .padding(.bottom)
            HStack {
                if(tnx.from_address == "demo.eth") {
                    Image(systemName: "arrow.down.backward")
                        .foregroundColor(.red)
                } else {
                    Image(systemName: "arrow.down.forward")
                        .foregroundColor(.green)
                }
                
                Text("$\(tnx.amount_in_quote!)")
            }
        }
        .padding(.vertical)
    }
}
