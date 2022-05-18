//
//  TokenLogic.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/18.
//

import Foundation

class TokenLogic: ObservableObject {
    @Published var items = [TokenModel]()
    
    init() {
        loadTokens()
        if items.isEmpty {
            items = [
                TokenModel(id: 0, name: "ETH", image: "eth", amount: 2, price: 4000),
                TokenModel(id: 1, name: "BTC", image: "btc", amount: 5, price: 50000)
            ]
        }
    }
    
    func loadTokens() {
        if let path = Bundle.main.path(forResource: "tokens", ofType: "json") {
            if let jsonStr = try? String(contentsOfFile: path) {
                if let list = try? JSONSerialization.jsonObject(with: jsonStr.data(using: .utf8) ?? Data(), options: .mutableContainers) as? [[String: Any]] {
                    list.forEach { dic in
                        let token = TokenModel(id: dic["id"] as! Int, name: dic["name"] as! String, image: dic["image"] as! String, amount: dic["amount"] as! Int, price: dic["price"] as! Double)
                        items.append(token)
                    }
                }
            }
        }
    }
}
