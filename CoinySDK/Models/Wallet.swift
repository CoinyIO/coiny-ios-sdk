//
//  Wallet.swift
//  Coiny
//
//  Created by Kemal Kocabiyik on 25.12.2017.
//  Copyright © 2017 Kemal Kocabiyik. All rights reserved.
//

import Foundation

struct WalletRequest: Codable {

}

public struct WalletResponse : BaseModel {
    var id: String
    var createDate: Date?
    var balance: Double
    var type : WalletType
    var name: String!
    var currency: CurrencyResponse
    var addresses : [WalletAddress]!
    var isTagEnabled : Bool
}

public struct CurrencyResponse : BaseModel {
    var id: String
    var createDate: Date?
    var name: String
    var shortName: String
    var symbol: String
}

public struct WalletAddress: BaseModel {
    var id: String
    var createDate: Date?
    var name: String!
    var address: String!
    var tag: String!
}

enum WalletType : String , Codable {
    case Undefined = "Undefined"
    case Crypto = "Crypto"
    case Fiat = "Fiat"
}
