//
//  NetworkError.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import Foundation

enum NetworkError: Error, Equatable {
    case invalidUrl
    case timeOut(String?)
    case unknown(String?)
    case cancelled(String?)
    case generic(String?)
    case noConnection(String?)
    case unauthorized
    case invalidData
    case uploadFailed(String?)
    case cacheRule(String?)
    case parse(String?)
    
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidUrl, .invalidUrl): return true
        case (.timeOut, .timeOut): return true
        case (.unknown, .unknown): return true
        case (.cancelled, .cancelled): return true
        case (.generic, .generic): return true
        case (.noConnection, .noConnection): return true
        case (.unauthorized, .unauthorized): return true
        case (.invalidData, .invalidData): return true
        case (.uploadFailed, .uploadFailed): return true
        case (.cacheRule, .cacheRule): return true
        case (.parse, .parse): return true
        default: return false
        }
    }
}
