//
//  TokenBalance.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 14/06/21.
//

import Foundation
import SwiftUI

struct TokenBalance: Codable, Hashable, Identifiable {
    var id = UUID()
    var contract_decimals: Int?
    var contract_name: String?
    var contract_ticker_symbol: String?
    var contract_address: String?
    var supports_erc: [String]?
    var logo_url: String?
    var quote_rate: Double?
    var amount: Double?
    var balance: Double?
}
