//
//  BankAccount.swift
//  Coiny
//
//  Created by Kemal Kocabiyik on 13.01.2018.
//  Copyright © 2018 Kemal Kocabiyik. All rights reserved.
//

import UIKit

public struct BankAccountRequest: Codable {
    var iban: String!
    var accountType: String!
    var name: String!
}


public struct BankAccountResponse: BaseModel {
    var id: String
    var createDate: Date?
    var name: String
    var accountType: String
    var iban: String
}
