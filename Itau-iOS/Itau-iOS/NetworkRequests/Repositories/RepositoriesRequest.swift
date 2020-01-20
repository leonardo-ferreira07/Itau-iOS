//
//  RepositoriesRequest.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import Foundation

struct RepositoriesRequest: RequestProtocol {
    
    private var page: Int = 0
    
    init(page: Int = 0) {
        self.page = page
    }
    
    var urlString: String {
        return URLConstants.repositoriesURL
    }
    
    var method: URLMethod {
        return .GET
    }
    
    var queryItems: [URLQueryItem]? {
        return [URLQueryItem(name: "sort", value: "stars"),
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "language", value: "Java")]
    }
    
    var headers: [String : String]?
}

