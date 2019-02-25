//  PaymentMethod.swift
//  Coiny
//
//  Created by Ömral Cörüt on 27.02.2018.
//  Copyright © 2018 Kemal Kocabiyik. All rights reserved.
//

import Foundation

public struct PaymentMethodResponse: BaseModel {
    var id: String
    var createDate: Date?
    var name: String
    var slug: String
    var depositEnabled: Bool
    var withdrawEnabled: Bool
    var isPercental: Bool
    var depositFeeAmount: Double
    var minimumDepositAmount: Double
    var minimumWithdrawalAmount: Double
    var withdrawalFeeAmount: Double
}
