//
//  CoinySDKTests.swift
//  CoinySDKTests
//
//  Created by KEMAL KOCABIYIK on 12.07.2018.
//  Copyright © 2018 KEMAL KOCABIYIK. All rights reserved.
//

import XCTest
@testable import CoinySDK

class CoinySDKTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        Coiny.initialize(appId: "08d5e7c5-efb7-9b6d-8986-8682d8132701", appSecret: "7mrlet01mn5NPB3PhcYX13l8G5xRX8/vR87mryZph/E=")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
