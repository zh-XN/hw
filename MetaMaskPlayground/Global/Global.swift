//
//  Global.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/17.
//

import SwiftUI

public enum Currency {
    public static let CNY = "CNY"
    public static let USD = "USD"
}

public class Global: ObservableObject {
    
    public enum Colors {
        static let income = Color.green
        static let outcome = Color.red
        static let description = Color.gray
        static let title = Color.black
        static let textNormal = Color.black
    }
    
    static let shared = Global()
    var dateFormatter = DateFormatter()
    
    @Published var selectedCurrency = Currency.CNY
    @Published var currentWalletAddress = "0xeC3D63B3091bd17463f6102424EEb75A4130E0D4"
    @Published var currentAccountName = "Account 1"
    @Published var currentBalance = 1008688.88
    @Published var currentCurrencySymbol = "¥"
    
    // 以 iPhone 13 pro 的分辨率为基准进行转换
    let baseWidth = 390.0
    let baseHeight = 844.0
    
    var deviceWidth = 390.0
    var deviceHeight = 844.0
    
    init() {
        if let currency = UserDefaults.standard.value(forKey: "userSelectedCurrency") as? String {
            selectedCurrency = currency
        }
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        deviceWidth = UIScreen.main.bounds.width
        deviceHeight = UIScreen.main.bounds.height
    }
    
}
