//
//  TransactionHistoryPage.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/17.
//

import SwiftUI

struct TransactionHistoryPage: View {
    @ObservedObject var logic: TransactionHistoryLogic
    
    init() {
        logic = TransactionHistoryLogic()
        logic.useItems(loadFromJsonFile())
    }
    
    func loadFromJsonFile() -> [TransactionHistoryModel] {
        var historyList = [TransactionHistoryModel]()
        if let path = Bundle.main.path(forResource: "transaction_history", ofType: "json") {
            if let jsonStr = try? String(contentsOfFile: path) {
                if let list = try? JSONSerialization.jsonObject(with: jsonStr.data(using: .utf8) ?? Data(), options: .mutableContainers) as? [[String: Any]] {
                    list.forEach { dic in
                        let history = TransactionHistoryModel(id: dic["id"] as! Int, currency: dic["currency"] as! String, from: dic["from"] as! String, to: dic["to"] as! String, amount: dic["amount"] as! Double, serviceFee: dic["serviceFee"] as! Double, date: Global.shared.dateFormatter.date(from: dic["date"] as! String)!)
                        historyList.append(history)
                    }
                }
            }
        }
        
        if historyList.isEmpty {
            historyList = [
                TransactionHistoryModel(from: "0xeC3D63B3091bd17463f6102424EEb75A4130E0D4", to: "0x2424EEb75A4130E0D4eC3D63B3091bd17463f610", amount: 10, serviceFee: 0.1),
                TransactionHistoryModel(from: "0xeC3D63B3091bd17463f6102424EEb75A4130E0D4", to: "0x2424EEb75A4130E0D4eC3D63B3091bd17463f610", amount: 20, serviceFee: 0.11),
                TransactionHistoryModel(from: "0xeC3D63B3091bd17463f6102424EEb75A4130E0D4", to: "0x2424EEb75A4130E0D4eC3D63B3091bd17463f610", amount: 30, serviceFee: 0.2),
            ]
            
        }
        
        return historyList
    }
    
    var body: some View {
        VStack {
            NaviBar(hidesButtons: true, hidesSubTitle: true, title: "历史交易")
            List {
                ForEach(self.logic.items) {
                    item in
                    TransactionHistoryRowCell(index: item.id).environmentObject(self.logic).frame(height: 70.fitH())
                }
            }.listStyle(.plain)
        }
    }
}

struct TransactionHistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryPage()
    }
}
