//
//  Itau-iOSReviewsLogicControllerTests.swift
//  Itau-iOSTests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import XCTest
@testable import Itau_iOS

class RepositoriesLogicControllerTests: XCTestCase {

    private var viewController: RepositoriesViewController!
    private var logicController: RepositoriesLogicController!
    
    override func setUp() {
        super.setUp()
        self.initializeViewController()
    }
    
    func initializeViewController() {
        viewController = RepositoriesViewController()
        viewController.loadView()
        viewController.viewDidLoad()
        logicController = viewController.repositoriesLogicController
    }
    
    override func tearDown() {
        self.logicController = nil
        self.viewController = nil
        super.tearDown()
    }
    
}

//MARK:- TableView
extension RepositoriesLogicControllerTests {
    
    func testHasTableView() {
        XCTAssertNotNil(viewController.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewController.tableView?.delegate)
    }
    
    func testTableViewConformsToTableViewDelegateProtocol() {
        XCTAssertTrue(logicController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(logicController.responds(to: #selector(logicController.tableView(_:willDisplay:forRowAt:))))
    }
    
    func testTableViewConformsToScrollViewDelegateProtocol() {
        XCTAssertTrue(logicController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(logicController.responds(to: #selector(logicController.scrollViewDidEndDragging(_:willDecelerate:))))
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewController.tableView?.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(logicController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(logicController.responds(to: #selector(logicController.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(logicController.responds(to: #selector(logicController.tableView(_:cellForRowAt:))))
    }
    
    func testTableViewCellsRegistered() {
        let tableView = viewController.tableView
        guard let registeredNibs = tableView?.value(forKey: "_nibMap") as? [String: UINib] else{
            XCTFail("No registered nibs")
            return
        }
        
        let shouldBeRegistered: [String] = [RepositoriesTypeCell.repository.rawValue]
        let flatNib = Array(registeredNibs.map({ $0.key }))
        if !shouldBeRegistered.containsSameElements(as: flatNib) {
            XCTFail("Missing registered nibs")
        }
    }
    
}
