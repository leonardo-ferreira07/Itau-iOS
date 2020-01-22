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

    let output: Output

    private let bag = DisposeBag()
    private let propertyId: Int
//    private let activityTracker = RxActivityTracker()
    
    // MARK: Outputs
    private let pullRequests = PublishSubject<[PullRequest]>()

    init(propertyId: Int) {

        let emptyPullRequests: [PullRequest] = []

        self.output = Output(cells: pullRequests.asDriver(onErrorJustReturn: emptyPullRequests))
        self.propertyId = propertyId
        
        requestPullRequests()
    }
}

// MARK: - Private methods
private extension PullRequestsViewModel {
    
    func requestPullRequests() {
        
    }
    
}

// MARK: - Input/Output declaration
extension PullRequestsViewModel {
    
    struct Output {
        let cells: Driver<[PullRequest]>
    }
}
    
