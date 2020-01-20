//
//  Repository.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import Foundation

struct Repositories: Decodable {
    let items: [Repository]
}

struct Repository: Decodable {
    let name: String
    let owner: RepositoryOwner
    let description: String
    let stars: Int
    let forks: Int
    
    // MARK: - Coding Keys
    
    private enum CodingKeys: String, CodingKey {
        case name
        case owner
        case description
        case stars = "stargazers_count"
        case forks = "forks_count"
    }
}

struct RepositoryOwner: Decodable {
    let login: String
    let avatar: String
    
    // MARK: - Coding Keys
    
    private enum CodingKeys: String, CodingKey {
        case login
        case avatar = "avatar_url"
    }
}
