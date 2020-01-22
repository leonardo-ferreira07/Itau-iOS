//
//  PullRequestsFactory.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit

struct PullRequestsFactory {
    
    // MARK: - Functions
    
    func makePullRequestVC(_ repository: Repository) -> UIViewController {
        let viewModel = PullRequestsViewModel(repository: repository)
        let controller = PullRequestsViewController(viewModel: viewModel)
        
        return controller
    }
    
}
