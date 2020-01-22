//
//  RepositoriesNavigator.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit

class RepositoriesNavigator: AwesomeNavigator {
    
    // MARK: - Properties
    enum Destination {
        case pullRequests(repository: Repository)
    }

    private weak var navController: UINavigationController?
    private let pullRequestsFactory: PullRequestsFactory
    
    // MARK: - Initialisers
    init(
        navController: UINavigationController?,
        pullRequestsFactory: PullRequestsFactory = .init()
    ) {
        self.navController = navController
        self.pullRequestsFactory = pullRequestsFactory
    }
    
    // MARK: - Functions
    func navigate(to destination: Destination) {
        switch destination {
        case .pullRequests(let repo):
            let viewController = pullRequestsFactory.makePullRequestVC(repo)
            navController?.pushViewController(viewController, animated: true)
        }
    }
    
}
