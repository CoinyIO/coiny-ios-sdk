//
//  TradePair.swift
//  Coiny
//
//  Created by Kemal Kocabiyik on 16.01.2018.
//  Copyright © 2018 Kemal Kocabiyik. All rights reserved.
//

import UIKit

public struct TradePairRequest {
    var name: String!
}


public struct TradePairResponse: BaseModel {
    var id: String
    var createDate: Date?
    var name: String!
    var firstCurrency : CurrencyResponse!
    var secondCurrency : CurrencyResponse!
}
