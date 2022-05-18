//
//  FitSize.swift
//  MetaMaskPlayground
//
//  Created by Zh on 2022/5/18.
//

import Foundation

extension Int {
    func fitW() -> Int {
        return Int((Global.shared.deviceWidth / Global.shared.baseWidth) * Double(self))
    }
    
    func fitH() -> Int {
        return Int((Global.shared.deviceHeight / Global.shared.baseHeight) * Double(self))
    }
}

extension Double {
    func fitW() -> Double {
        return Global.shared.deviceWidth / Global.shared.baseWidth * self
    }
    
    func fitH() -> Double {
        return Global.shared.deviceHeight / Global.shared.baseHeight * self
    }
}

