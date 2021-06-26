//
//  WalletDB.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 12/06/21.
//

import Foundation
import RealmSwift

class WalletDB: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var address = ""
    
    // inforces uniqueness
    override static func primaryKey() -> String? {
        "id"
    }
}

