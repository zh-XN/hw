//
//  TransactionHistoryModel.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/17.
//

import Foundation

struct TransactionHistoryModel: Identifiable {
    var id: Int = 0
    var currency = "CNY"
    var from = ""
    var to = ""
    var amount = Double(0)
    var serviceFee = Double(0)
    var date = Date()
}
