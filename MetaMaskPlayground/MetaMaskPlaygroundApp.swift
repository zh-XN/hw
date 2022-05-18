//
//  MetaMaskPlaygroundApp.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/16.
//

import SwiftUI

@main
struct MetaMaskPlaygroundApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabBarContainer()
        }
    }
}

struct MetaMaskPlaygroundApp_Preivews: PreviewProvider {
    static var previews: some View {
        TabBarContainer()
    }
}
