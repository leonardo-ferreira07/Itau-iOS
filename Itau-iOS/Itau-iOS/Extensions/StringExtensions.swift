//
//  StringExtensions.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import Foundation

extension String {
    
    func url(withQueryItems queryItems: [URLQueryItem]? = nil) -> URL? {
        var urlComponents = URLComponents(string: self)
        
        if queryItems?.count ?? 0 > 0 {
            urlComponents?.queryItems = queryItems
        }
        
        return urlComponents?.url
    }
    
}
