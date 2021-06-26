//
//  TransactionView.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 23/06/21.
//

import SwiftUI

struct TransactionView: View {
    @ObservedObject var txnVM: TransactionViewModel
    
    var body: some View {
        TransactionListView(txnVM: txnVM)
            .navigationTitle("Transactions")
    }
}
