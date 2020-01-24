//
//  NetworkRequesterTests.swift
//  Itau-iOSTests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 31/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import XCTest
@testable import Itau_iOS

class NetworkRequesterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworkError() {
        XCTAssertEqual(NetworkError.invalidUrl, NetworkError.invalidUrl)
        XCTAssertEqual(NetworkError.timeOut(UUID().uuidString), NetworkError.timeOut(UUID().uuidString))
        XCTAssertNotEqual(NetworkError.timeOut(UUID().uuidString), NetworkError.cacheRule(UUID().uuidString))
    }
    
    func testPerformRequestUrlError() {
        let exp = expectation(description: "testPerformRequestUrlError")
        exp.expectedFulfillmentCount = 1
        
        class RequestMock: RequestProtocol {
            var queryItems: [URLQueryItem]?
            var headers: [String : String]?
            
            var urlString: String {
                return ""
            }
        }
        
        let requester = RequesterMock(expectedData: nil, expectedError: NetworkError.invalidUrl)
        let request = RequestMock()
        
        requester.performRequest(request) { (data: Repository?, error) in
            exp.fulfill()
            XCTAssertNil(data)
            XCTAssertEqual(error!, NetworkError.invalidUrl)
        }
        
        wait(for: [exp], timeout: 1)
    }

}
