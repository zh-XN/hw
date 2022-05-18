//
//  TransactionHistoryRowCell.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/17.
//

import SwiftUI

struct TransactionHistoryRowCell: View {
    @EnvironmentObject var logic: TransactionHistoryLogic
    var index = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 4.fitH()) {
            HStack {
                Text("\(logic.items[index].currency)")
                    .fontWeight(.bold)
                    .foregroundColor(Global.Colors.title)
                Spacer()
                Text("\(date2Str( logic.items[index].date))")
                    .foregroundColor(Global.Colors.description)
            }.frame(alignment: .leading)
            HStack {
                Text("从: \(logic.items[index].from)")
                    .truncationMode(.middle)
                    .lineLimit(1)
                    .frame(width: 200.fitW(), alignment: .leading)
                Spacer()
                Text("+\(String(format: "%.2f", logic.items[index].amount))")
                    .foregroundColor(Global.Colors.income)
                
            }.frame(alignment: .leading)
            HStack {
                Text("到: \(logic.items[index].to)")
                    .truncationMode(.middle)
                    .lineLimit(1)
                    .frame(width: 200.fitW(), alignment: .leading)
                Spacer()
                Text("手续费：-\(String(format: "%.2f",  logic.items[index].serviceFee))")
                    .foregroundColor(Global.Colors.outcome)
            }.frame(alignment: .leading)
        }
    }
    
    func date2Str(_ date: Date) -> String {
        return Global.shared.dateFormatter.string(from: date)
    }
}
