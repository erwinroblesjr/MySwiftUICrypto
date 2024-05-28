//
//  Coin.swift
//  MySwiftUICrypto
//
//  Created by Erwin Robles on 5/27/24.
//

import Foundation

/*
 
 "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
 
 */

struct Coin: Identifiable, Codable{
    let id,
        symbol,
        name,
        image: String
    let currentPrice: Double
    let priceChangePercentage24H,
        currentHoldings,
        marketCapRank: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentHoldings = ""
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
        case priceChangePercentage24H = "price_change_percentage_24h"
    }
    
    func updateHoldings(amount: Double) -> Coin {
        return Coin(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, priceChangePercentage24H: priceChangePercentage24H, currentHoldings: amount, marketCapRank: marketCapRank)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int{
        return Int(marketCapRank ?? 0)
    }
}

