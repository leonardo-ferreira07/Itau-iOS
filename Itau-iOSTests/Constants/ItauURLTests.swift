//
//  Itau-iOSTests.swift
//  Itau-iOSTests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import XCTest
@testable import Itau_iOS

class ItauURLTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMainRepositoriesURLIsCorrect() {
        XCTAssertEqual(URLConstants.repositoriesURL, "https://api.github.com/search/repositories")
    }
    
    func testMainRepositoriesURLIsCorrectWithQueries() {
        XCTAssertEqual(RepositoriesRequest().urlRequest?.url?.absoluteString, "https://api.github.com/search/repositories?sort=stars&page=1&q=language:Java")
    }

}
