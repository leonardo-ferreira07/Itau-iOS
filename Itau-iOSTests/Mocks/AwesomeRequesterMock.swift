//
//  AwesomeRequesterMock.swift
//  Itau-iOSTests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 31/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import Foundation
@testable import Itau_iOS

class RequesterMock: NetworkRequester {
    
    var expectedData: Decodable?
    var expectedError: NetworkError?
    
    init(expectedData: Decodable?, expectedError: NetworkError?) {
        super.init()
        
        self.expectedData = expectedData
        self.expectedError = expectedError
    }
    
    override func performRequest<T>(_ request: RequestProtocol, completion: @escaping (T?, NetworkError?) -> Void) where T : Decodable {
        completion(self.expectedData as? T, self.expectedError)
    }
}
