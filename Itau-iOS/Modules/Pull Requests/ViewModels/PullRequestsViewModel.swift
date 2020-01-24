//
//  PullRequestsViewModel.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct PullRequestsViewModel: ViewModel {
    
    typealias PullRequestType = [PullRequestCellViewModel]

    let output: Output

    private let bag = DisposeBag()
    private let activityTracker = RxActivityTracker()
    private let repository: Repository
    
    // MARK: Outputs
    private let pullRequests = PublishSubject<PullRequestType>()

    init(repository: Repository) {

        let emptyPullRequests: PullRequestType = []

        self.output = Output(cells: pullRequests.asDriver(onErrorJustReturn: emptyPullRequests))
        self.repository = repository
        
        requestPullRequests()
    }
    
}

// MARK: - Private methods
private extension PullRequestsViewModel {
    
    func requestPullRequests() {
        let requester: NetworkRequester = NetworkRequester()
        let pullRequestsRequest = PullRequestsRequest(owner: repository.owner.login, repository: repository.name)
        guard let url = pullRequestsRequest.urlRequest else { return }

        _ = requester.dispatch(url)
            .mapArray(PullRequest.self)
            .map({ $0.map(PullRequestCellViewModel.init) })
            .bind(onNext: pullRequests.onNext)
            .disposed(by: bag)
    }
    
}

// MARK: - Input/Output declaration
extension PullRequestsViewModel {
    
    struct Output {
        let cells: Driver<PullRequestType>
    }
}
