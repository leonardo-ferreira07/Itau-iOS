//
//  RepositoriesViewModel.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import Foundation

enum RepositoriesTypeCell: String {
    case repository = "ItauRepository"
}

struct RepositoriesCell {
    var type: RepositoriesTypeCell = .repository
    var repository: Repository?
    
    init(_ repository: Repository?, type: RepositoriesTypeCell = .repository) {
        self.repository = repository
        self.type = type
    }
}

class GetYourGuideReviewsViewModel {
    
    private let requester: NetworkRequester = NetworkRequester()
    private var repositoriesRequest: RepositoriesRequest!
    private var cells: [RepositoriesCell] = []
    
    var isLoadingContent: Bool = false
    
    func getData(page: Int = 0, response: @escaping ([RepositoriesCell]) -> Void) {
        isLoadingContent = true
        response([])
        
        repositoriesRequest = RepositoriesRequest(page: page)
        requester.performRequest(repositoriesRequest) { [weak self] (data: Repository?, error) in
            guard let self = self else { return }
            self.isLoadingContent = false
            
            if let error = error {
                print(error)
                
                if self.cells.isEmpty {
//                    self.cells.append(RepositoriesCell(nil, type: .error))
                }
                response(self.cells)
                return
            }
            
            if page == 0 {
                self.cells = []
            }
//            for repository in data?.reviews ?? [] {
//                self.cells.append(RepositoriesCell.init(review))
//            }
            
            response(self.cells)
        }
    }
    
}

