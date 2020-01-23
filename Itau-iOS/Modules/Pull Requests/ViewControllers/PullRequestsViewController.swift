//
//  PullRequestsViewController.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit

class PullRequestsViewController: BaseController<PullRequestsListView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllerTitle()
    }
    
}

// MARK: - UI Title configuration

extension PullRequestsViewController {
    
    private func configureViewControllerTitle() {
        title = "Pull Requests"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
}
