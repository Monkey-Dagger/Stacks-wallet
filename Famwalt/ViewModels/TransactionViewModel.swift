//
//  TransactionViewModel.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 23/06/21.
//

import Foundation
import Combine
import Alamofire

class TransactionViewModel: ObservableObject {
    @Published var txns = [Transaction]()

    init(chainID: String, address: String, currency: String) {
        getAllBaseTxn(chainID: chainID, address: address, currency: currency)
    }
    
    func getAllBaseTxn(chainID:String, address:String, currency:String) {
        let url:String = covalentAPI + "/v1/" + chainID + "/address/" + address + "/transactions_v2/"
        
      let params:[String:Any] = [
        "key": covalentAPIKey,
        "quote-currency": currency.lowercased(),
        "no-logs": true
      ]
        
      let req = AF.request(
        url,
        method: .get,
        parameters: params
      )

      req.responseJSON { res in

        var txns: [Transaction] = []
        if let json = res.value as? [String:Any] {

          if let data = json["data"] as? [String:Any] {

            if let items = data["items"] as? [[String:Any]] {

                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
              for item in items {
                
                var txn = Transaction()
                
                // txn stuff
                txn.block_signed_at = dateformatter.date(from: (item["block_signed_at"] as? String)!)!
                txn.tx_hash = item["tx_hash"] as? String
                txn.tx_offset = item["tx_offset"] as? Int
                txn.success = item["successful"] as? Bool
                txn.from_address = item["from_address"] as? String
                txn.to_address = item["to_address"] as? String
                txn.from_address_label = item["from_address_label"] as? String
                txn.to_address_label = item["to_address_label"] as? String
                
                txn.amount = Double(item["value"] as? String ?? "0")
                txn.amount! /= pow(10, 18) // hard coded oh no
                txn.amount_in_quote = item["value_quote"] as? Double

                // gas stuff
                txn.gas_offered = item["gas_offered"] as? Double
                txn.gas_price = item["gas_price"] as? Double
                txn.gas_spent = item["gas_spent"] as? Double
                txn.gas_spent_quote = item["gas_quote"] as? Double
                txn.gas_rate_quote = item["value_quote"] as? Double

                txns.append(txn)

              }
            }
          } else { // if json["data"] == null
            print("Error retriving balances - \(json)")
          }
        }
        self.txns.append(contentsOf: txns)
      }
    }
}
