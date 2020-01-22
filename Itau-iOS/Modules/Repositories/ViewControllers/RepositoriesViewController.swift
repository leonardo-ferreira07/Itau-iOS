//
//  RepositoriesViewController.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit

class RepositoriesViewController: UITableViewController {

    var repositoriesLogicController: RepositoriesLogicController?
    
    // MARK: - Initialisers

    init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllerTitle()
        setLogicControllers()
        loadTableView()
    }
    
}

// MARK: - Logic Controller

extension RepositoriesViewController {
    
    func setLogicControllers() {
        repositoriesLogicController = RepositoriesLogicController(tableView: tableView, navigator: RepositoriesNavigator.init(navController: navigationController))
    }
    
    func loadTableView() {
        repositoriesLogicController?.loadTableView()
    }
}

// MARK: - UI Title configuration

extension RepositoriesViewController {
    
    private func configureViewControllerTitle() {
        title = "Repositories"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
}
