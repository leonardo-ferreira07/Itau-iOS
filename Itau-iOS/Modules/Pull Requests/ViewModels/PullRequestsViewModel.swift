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
    private let propertyId: Int
//    private let activityTracker = RxActivityTracker()
    
    // MARK: Outputs
    private let pullRequests = PublishSubject<PullRequestType>()

    init(propertyId: Int) {

        let emptyPullRequests: PullRequestType = []

        self.output = Output(cells: pullRequests.asDriver(onErrorJustReturn: emptyPullRequests))
        self.propertyId = propertyId
        
        requestPullRequests()
    }
}

// MARK: - Private methods
private extension PullRequestsViewModel {
    
    func requestPullRequests() {
        let requester: NetworkRequester = NetworkRequester()
        let repositoriesRequest = PullRequestsRequest(owner: "ReactiveX", repository: "RxSwift")
        requester.performRequest(repositoriesRequest) { (data: [PullRequest]?, error) in
            guard let data = data else { return }
            var pulls: PullRequestType = []
            for pull in data {
                pulls.append(PullRequestCellViewModel.init(pullRequest: pull))
            }
            self.pullRequests.onNext(pulls)
        }
    }
    
}

// MARK: - Input/Output declaration
extension PullRequestsViewModel {
    
    struct Output {
        let cells: Driver<PullRequestType>
    }
}
    
