//
//  Price.swift
//  Coiny
//
//  Created by Omer Karaca on 8.01.2018.
//  Copyright © 2018 Kemal Kocabiyik. All rights reserved.
//

import Foundation

public struct PriceResponse: Codable {
    var bid: Double!
    var ask: Double!
    var size: Double!
    var price: Double!
    var volume: Double!
    var tradeId: String!
    var currency: CurrencyResponse!
}

public struct MarketCandleResponse: Codable {
    var lowPrice: Double!
    var highPrice: Double!
    var openPrice: Double!
    var closePrice: Double!
    var volumePrice: Double!
    var volumeQuantity: Double!
    var weightedAverage: Double!
    var timestamp : Date!
}

public struct StatsResponse: Codable {
    var lowPrice: Double!
    var highPrice: Double!
    var openPrice: Double!
    var nowPrice: Double!
    var volume: Double!
}

