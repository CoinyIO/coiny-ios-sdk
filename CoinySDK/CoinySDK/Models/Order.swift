//
//  Order.swift
//  Coiny
//
//  Created by Kemal Kocabiyik on 14.01.2018.
//  Copyright © 2018 Kemal Kocabiyik. All rights reserved.
//

import UIKit
public struct OrderRequest: Codable {
    var quantity : Decimal
    var price : Decimal
    var pair : String
    var orderType : OrderType
    
    public init (pair : String, orderType : OrderType, quantity : Decimal = 0 , price : Decimal = 0 ){
        self.pair = pair
        self.orderType = orderType
        self.quantity = quantity
        self.price = price
    }
}

public struct OrderResponse: BaseModel {
    var id: String
    var createDate: Date?
    var transactions : [TransactionResponse]!
}

public enum OrderType : String, Codable{
    case Market = "Market"
    case Limit = "Limit"
}
