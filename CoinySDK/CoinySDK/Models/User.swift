//
//  User.swift
//  Coiny
//
//  Created by Kemal Kocabiyik on 26.11.2017.
//  Copyright © 2017 Kemal Kocabiyik. All rights reserved.
//

import UIKit

public class UserRequest: Codable {
    var firstname: String!
    var lastname: String!
    var email: String!
    var password: String!
    var confirmPassword: String!
    var phoneNumber: String!
}

public struct UserResponse: BaseModel {
    var id: String
    var createDate: Date?
    var roles: [UserRoleModel]?
    var email: String!
    var phoneNumber: String!
    var firstname: String!
    var lastname: String!
    var imageUrl: String?
    var status: VerificationStatus!
    var voucherId : String!

}

public struct UserRoleModel: BaseModel {
    var id: String
    var createDate: Date?
    var name: String!
    var displayName: String!
    var description: String!
}


public struct UserLimitsResponse: BaseModel  {
    var id: String
    var createDate: Date?
    var currentDailyFiatDeposit: Double?
    var currentDailyFiatWithdrawal: Double?
    var currentMonthlyFiatDeposit : Double?
    var currentMonthlyFiatWithdrawal: Double?
    var dailyMaxFiatDeposit: Double?
    var dailyMaxCryptoDeposit: Double?
    var dailyMaxFiatWithdrawal : Double?
    var dailyMaxCryptoWithdrawal: Double?
    var monthlyMaxCryptoDeposit: Double?
    var monthlyMaxFiatDeposit: Double?
    var monthlyMaxFiatWithdrawal: Double?
    var monthlyMaxCryptoWithdrawal : Double?
    var type: Int?
}

public enum VerificationStatus: String, Codable {
    case Rejected = "Rejected"
    case Unverified = "Unverified"
    case Processing = "Processing"
    case Verified = "Verified"
}
