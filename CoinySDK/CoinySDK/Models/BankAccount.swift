//
//  BankAccount.swift
//  Coiny
//
//  Created by Kemal Kocabiyik on 13.01.2018.
//  Copyright © 2018 Kemal Kocabiyik. All rights reserved.
//

import UIKit

public struct BankAccountRequest: Codable {
    var iban: String
    var accountType: AccountType
    var name: String
    public init(name : String ,iban : String , accountType : AccountType){
        self.name = name
        self.accountType = accountType
        self.iban = iban
    }
}


public struct BankAccountResponse: BaseModel {
    var id: String
    var createDate: Date?
    var name: String
    var accountType: String
    var iban: String
}

public enum AccountType : String, Codable{
    case iban = "Iban"
    case accountNumber = "AccountNumber"
}
