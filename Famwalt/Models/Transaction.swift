//
//  Transaction.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 23/06/21.
//

import Foundation
import SwiftUI

struct Transaction: Codable, Hashable, Identifiable {
    var id = UUID()
    
    // common stuff
    var block_signed_at: Date?
    var tx_hash: String?
    var tx_offset: Int?
    var success: Bool?
    var from_address: String?
    var to_address: String?
    var from_address_label: String?
    
    var to_address_label: String?
    
    // Token Specific
    var contract_address: String?
    var contract_decimals: Int?
    var contract_in_quote: Double?
    
    // stores base or calculated token
    var amount: Double?
    var amount_in_quote: Double?
    
    // gas stuff, can do more?
    var gas_offered: Double?
    var gas_price: Double?
    var gas_spent: Double?
    var gas_spent_quote: Double? // cost of txn
    var gas_rate_quote: Double? // price of eth
}
