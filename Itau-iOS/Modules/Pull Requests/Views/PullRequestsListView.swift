//
//  PullRequestsListView.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PullRequestsListView: BaseView<PullRequestsViewModel>, NibInitializableView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet private weak var tableView: UITableView!

    fileprivate let dataSource = RxGenericTableViewDataSource()
    private let bag = DisposeBag()

    override func layout() {
        tableView.registerRegisterableCell(PullRequestTableViewCell.self)
    }

    override func didLoad() {
        bind()
    }
    
}

private extension PullRequestsListView {

    func bind() {

        viewModel.output.cells
            .map(transformRentersCells)
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
    }
    
    func transformRentersCells(_ cells: PullRequestsViewModel.PullRequestType) -> [GenericSection] {
        return [GenericSection(title: nil, items: cells)].filter { $0.items.count > 0 }
    }

}
