//
//  PullRequestsRequest.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import Foundation

struct PullRequestsRequest: RequestProtocol {
    
    private var owner: String
    private var repository: String
    
    init(owner: String, repository: String) {
        self.owner = owner
        self.repository = repository
    }
    
    var urlString: String {
        return String(format: URLConstants.pullRequestsURL, owner, repository)
    }
    
    var method: URLMethod {
        return .GET
    }
    
    var queryItems: [URLQueryItem]?
    
    var headers: [String : String]?
}
