//
//  TokenModel.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/18.
//

import Foundation

struct TokenModel: Identifiable {
    var id = 0
    var name = ""
    var image = ""
    var amount = 0
    var price = Double(0)
}
