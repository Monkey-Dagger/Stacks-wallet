//
//  NftViewModel.swift
//  Famwalt
//
//  Created by Shreyas Papinwar on 15/06/21.
//

import Foundation
import Combine
import Alamofire

class NftViewModel: ObservableObject {
    @Published var nfts = [Nft]()
    
    init(chainID: String, address: String) {
        getAddressBalance(chainID: chainID, address: address)
    }
    
    func getAddressBalance(chainID: String, address: String) {
        let url: String = covalentAPI + "/v1/" + chainID + "/address/" + address.lowercased() + "/balances_v2/"
    
        let params:[String: Any] = ["key": covalentAPIKey, "nft": "true"]
        
        let req = AF.request(url, method: .get, parameters: params)
        
        var temp: [Nft] = []
        
        req.responseJSON { res in
            
            if let json = res.value as? [String: Any] {
                if let data = json["data"] as? [String: Any] {
                    if let items = data["items"] as? [[String: Any]] {
                        for i in items {
                            
                            if let nft_data = i["nft_data"] as? [[String: Any]] {
                                for item in nft_data {
                                    
                                                                        
                                    var nft = Nft()
                                    nft.contract_name = i["contract_name"] as? String
                                    nft.contract_ticker_symbol = i["contract_ticker_symbol"] as? String
                                    nft.logo_url = i["logo_url"] as? String
                                    nft.owner = item["owner"] as? String ?? "null"
                                    nft.token_id = item["token_id"] as? String ?? "0"
                                    if let external_data = item["external_data"] as? [String: Any] {
                                        nft.name = external_data["name"] as? String
                                        nft.image_url = external_data["image"] as? String
                                        nft.description = external_data["description"] as? String
                                        nft.external_url = external_data["external_url"] as? String
                                        
                                        
                                        temp.append(nft)
                                    }
                                    
                                    
                                }
                                
                            }
                        }
                        
                    }
                } else { // if json["data"] == null
                    print("Error retriving balances - \(json)")
                }
            }
            self.nfts = temp
        }
        
    }
}
