//
//  PullRequestCellViewModel.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit

struct PullRequestCellViewModel: ViewModel {
    
    // MARK: - Properties
    let title: String
    let body: String
    let date: String
    let user: RepositoryOwner
    
    // MARK: - Output
    let output: Output

    init(pullRequest: PullRequest) {
        self.output = Output(title: pullRequest.title, body: pullRequest.body, date: pullRequest.date, user: pullRequest.user)
        self.title = pullRequest.title
        self.body = pullRequest.body
        self.date = pullRequest.date
        self.user = pullRequest.user
    }
}

extension PullRequestCellViewModel: ItemizableViewModel {
    var cellIdentifier: String { return PullRequestTableViewCell.reuseIdentifier }
}

extension PullRequestCellViewModel {
    struct Output {
        let title: String
        let body: String
        let date: String
        let user: RepositoryOwner
    }
}
