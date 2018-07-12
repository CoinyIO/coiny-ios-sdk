//
//  Order.swift
//  Coiny
//
//  Created by Kemal Kocabiyik on 14.01.2018.
//  Copyright © 2018 Kemal Kocabiyik. All rights reserved.
//

import UIKit
public struct OrderRequest: Codable {
}

public struct OrderResponse: BaseModel {
    var id: String
    var createDate: Date?
    var transactions : [TransactionResponse]!
}

