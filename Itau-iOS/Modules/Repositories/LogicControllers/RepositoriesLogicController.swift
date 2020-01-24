//
//  RepositoriesLogicController.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import Foundation
import UIKit

class RepositoriesLogicController: NSObject {
    
    private lazy var repositoriesViewModel: RepositoriesViewModel = RepositoriesViewModel()
    private var repositoriesCells: [RepositoriesCell] = []
    private let activityView = UIActivityIndicatorView(style: .large)
    private let bottomActivityView = UIActivityIndicatorView(style: .medium)
    private var page: Int = 1
    private weak var tableView: UITableView!
    private var repositoriesNavigator: RepositoriesNavigator!
    
    // MARK: Public methods
    
    init(tableView: UITableView, navigator: RepositoriesNavigator) {
        super.init()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView = tableView
        self.repositoriesNavigator = navigator
        
        setLoading()
        registerCells()
    }
    
    func loadTableView() {
        loadData()
    }
    
    // MARK: - Private methods
    
    fileprivate func registerCells() {
        tableView.register(UINib (nibName: "RepositoryTableViewCell", bundle: nil), forCellReuseIdentifier: RepositoriesTypeCell.repository.rawValue)
    }
    
    fileprivate func loadData(page: Int = 1) {
        
        repositoriesViewModel.getData(page: page) { [weak self] (cells) in
            guard let self = self else { return }
            
            if self.repositoriesViewModel.isLoadingContent {
                self.handleLoading(page == 1)
            } else {
                self.repositoriesCells = cells
                DispatchQueue.main.async { [weak self] in
                    self?.stopLoading()
                    self?.tableView.tableFooterView = nil
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
}

// MARK: - Table View Delegate

extension RepositoriesLogicController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? RepositoryTableViewCell {
            cell.setCellImages(with: repositoriesCells[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch repositoriesCells[indexPath.row].type {
        case .repository:
            return UITableView.automaticDimension
//        case .error:
//            return tableView.frame.size.height/2
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let repo = repositoriesCells[indexPath.row].repository else { return }
        repositoriesNavigator.navigate(to: .pullRequests(repository: repo))
    }
    
}

// MARK: - Table View Data Source

extension RepositoriesLogicController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoriesCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: repositoriesCells[indexPath.row].type.rawValue) else {
            return UITableViewCell()
        }
        
        if let cell = cell as? RepositoryTableViewCell {
            cell.setCell(with: repositoriesCells[indexPath.row])
        }
        
        return cell
    }
    
}

// MARK: Scroll view delegate

extension RepositoriesLogicController: UIScrollViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if maximumOffset - currentOffset <= 150.0 {
            page += 1
            loadData(page: page)
        }
    }
    
}

// MARK: Loading data

extension RepositoriesLogicController {
    
    private func setLoading() {
        activityView.center = tableView.center
        tableView.addSubview(activityView)
        
        bottomActivityView.startAnimating()
    }
    
    private func startLoading() {
        activityView.startAnimating()
    }
    
    private func stopLoading() {
        activityView.stopAnimating()
    }
    
    private func handleLoading(_ isFirstPage: Bool) {
        if isFirstPage {
            DispatchQueue.main.async { [weak self] in
                self?.startLoading()
            }
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.tableFooterView = self?.bottomActivityView
            }
        }
    }
}

