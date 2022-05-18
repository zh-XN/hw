//
//  TransactionHistoryLogic.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/17.
//

import Foundation

class TransactionHistoryLogic: ObservableObject {
    @Published var items = [TransactionHistoryModel]()
    var count = 0
    
    func useItems(_ items: [TransactionHistoryModel]) {
        count = 0
        items.forEach { model in
            let m = TransactionHistoryModel(id: count, currency: model.currency, from: model.from, to: model.to , amount: model.amount, serviceFee: model.serviceFee, date: model.date)
            self.items.append(m)
            count += 1
        }
    }
}
