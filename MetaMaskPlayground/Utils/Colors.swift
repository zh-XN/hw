//
//  Colors.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/17.
//

import Foundation
import SwiftUI

extension Color {
    init(hexR r: Int, g: Int, b:Int) {
        self.init(red: Double(r)/255.0, green: Double(g)/255.0, blue: Double(b)/255.0)
    }
}
