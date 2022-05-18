//
//  TabBarContainer.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/16.
//

import Foundation
import SwiftUI

struct TabBarContainer: View {
    
    enum Tabs: Int {
        case Home, TransactionHistory
    }
    
    @State var selectedIndex = Tabs.Home
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            HomePage().tabItem {
                Text("首页")
            }.tag(Tabs.Home)
            
            TransactionHistoryPage().tabItem {
                Text("历史交易")
            }.tag(Tabs.TransactionHistory)
        }
    }
}
