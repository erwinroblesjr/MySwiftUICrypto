//
//  PreviewProvider.swift
//  MySwiftUICrypto
//
//  Created by Erwin Robles on 5/27/24.
//

import SwiftUI

extension PreviewProvider{
    
    static var dev: DeveloperPreview{
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVm = HomeViewModel()
    
    let coin = Coin(id: "", symbol: "symbol", name: "Bitcind", image: "", currentPrice: 1234.0, priceChangePercentage24H: 5678.0, currentHoldings: nil, marketCapRank: nil)
}
