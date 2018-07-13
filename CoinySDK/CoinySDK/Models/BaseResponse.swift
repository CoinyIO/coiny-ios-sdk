//
//  BaseResponse.swift
//  Coiny
//
//  Created by Kemal Kocabiyik on 26.11.2017.
//  Copyright © 2017 Kemal Kocabiyik. All rights reserved.
//

import Foundation

protocol BaseModel: Codable {
    var id: String { get set }
    var createDate: Date? { get set }

}

protocol BaseResponseProperties : Codable {
    var status: String! { get set }
    var errors: [ErrorResponse]! { get set }
    var message: String! { get set }
    var errorCode: Int! { get set }
    associatedtype T
    var data: T! { get set }
}

protocol PaginatedProperties : Codable{
    var totalItemCount: Int! { get set }
    var currentPage: Int! { get set }
    var size: Int! { get set }
    var nextPage: Int! { get set }
    var previousPage: Int! { get set }
}

public struct ResponseWrapper<T : Codable>: Codable , PaginatedProperties , BaseResponseProperties {
    typealias myType = T
    var totalItemCount: Int!
    var currentPage: Int!
    var size: Int!
    var nextPage: Int!
    var previousPage: Int!
    var status: String!
    var errors: [ErrorResponse]!
    var message: String!
    var errorCode: Int!
    var data: myType!
}

public class ErrorResponse : Codable{

    var key: String!
    var code: Int!
    var description: String!
}


