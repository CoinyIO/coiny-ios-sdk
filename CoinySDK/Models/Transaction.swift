//
//  Transaction.swift
//  Coiny
//
//  Created by Kemal Kocabiyik on 25.12.2017.
//  Copyright © 2017 Kemal Kocabiyik. All rights reserved.
//

import Foundation

public struct TransactionResponse: BaseModel {
    var id: String
    var createDate: Date?
    var preBalance: Double
    var value: Double
    var currentBalance: Double
    var walletId: String
    var currency: CurrencyResponse
    var address: String?
    var status: TransactionStatus
    var type: TransactionType
    var desc: String?
    var tradeValue : Double!
    var tradeCurrency : CurrencyResponse!
}

public enum TransactionStatus: String , Codable {
    case Rejected = "Rejected"
    case Failed = "Failed"
    case Undefined = "Undefined"
    case Pending = "Pending"
    case Confirmed = "Confirmed"
    case Processing = "Processing"
    case Completed = "Completed"
}

public enum TransactionType: String , Codable {
    case Undefined = "Undefined"
    case Buy = "Buy"
    case Sell = "Sell"
    case FiatDeposit = "FiatDeposit"
    case FiatWithdraw = "FiatWithdraw"
    case CryptoDeposit = "CryptoDeposit"
    case CryptoWithdraw = "CryptoWithdraw"
    case Trade = "Trade"
    case CryptoFee = "CryptoFee"
    case MakerFee = "MakerFee"
    case TakerFee = "TakerFee"
    case FiatWithdrawFee = "FiatWithdrawFee"
}
