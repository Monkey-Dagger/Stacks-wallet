//
//  Currency.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 14/06/21.
//

import Foundation

struct Currency: Identifiable {
    var id = UUID()
    let systemName: String
    let name: String
    let sign: String
}
