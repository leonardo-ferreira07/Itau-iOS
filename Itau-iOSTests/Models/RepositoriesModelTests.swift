//
//  RepositoriesModelTests.swift
//  Itau-iOSTests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 24/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import XCTest
@testable import Itau_iOS

class RepositoriesModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModelAgainstDummyData() {
        guard let data = MockJSONLoader.loadJSONData(file: "repositories", usingClass: self) else {
            XCTFail("a json FILE is needed in order to proceed with the test")
            return
        }
        
        let decodedData = try? JSONDecoder().decode(Repositories.self, from: data)
        XCTAssertEqual(decodedData?.items[0].owner.login, "CyC2018")
        XCTAssertEqual(decodedData?.items[1].name, "JavaGuide")
        XCTAssertEqual(decodedData?.items.count, 30)
        
    }
    
}
