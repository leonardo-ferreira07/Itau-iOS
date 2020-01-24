//
//  MockJSONLoader.swift
//  Itau-iOSTests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import Foundation

public struct MockJSONLoader {
    
    private init() {
        
    }
    
    static func loadJSONData(file: String, usingClass: NSObject) -> Data? {
        let testBundle = Bundle(for: type(of: usingClass))
        if let path = testBundle.url(forResource: file, withExtension: "json") {
            do {
                return try? Data(contentsOf: path)
            }
        }
        return nil
    }
    
}
