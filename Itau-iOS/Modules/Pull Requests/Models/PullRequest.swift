//
//  PullRequest.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import Foundation

struct PullRequest: Decodable {
    let title: String
    let body: String
    let date: String
    let user: RepositoryOwner
    
    // MARK: - Coding Keys
    
    private enum CodingKeys: String, CodingKey {
        case title
        case body
        case date = "created_at"
        case user
    }
}
