//
//  Nft.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 14/06/21.
//

import Foundation
import SwiftUI

struct Nft: Codable, Hashable, Identifiable {
    var id = UUID()
    var description: String?
    var external_url: String?
    var image_url: String?
    var name: String?
    var owner: String?
    var token_id: String?
    var contract_name: String?
    var logo_url: String?
    var contract_ticker_symbol: String?
}
