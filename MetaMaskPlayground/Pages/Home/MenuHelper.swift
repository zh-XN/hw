//
//  MenuHelper.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/17.
//

import SwiftUI

// 用枚举用起来会舒服很多，虽然声明的时候麻烦点...
enum MenuButtonItem: Identifiable {
    case receive, buy, send, swap
    
    var id: Int {
        switch self {
        case .receive:
            return 0
        case .buy:
            return 1
        case .send:
            return 2
        case .swap:
            return 3
        }
    }
    
    var image: String {
        switch self {
        case .receive:
            return "receive"
        case .buy:
            return "buy"
        case .send:
            return "send"
        case .swap:
            return "swap"
        }
    }
    
    var title: String {
        switch self {
        case .receive:
            return "接收"
        case .buy:
            return "Buy"
        case .send:
            return "发送"
        case .swap:
            return "Swap"
        }
    }
}

class MenuHelper: ObservableObject {
    @Published var items = [MenuButtonItem]()
}
