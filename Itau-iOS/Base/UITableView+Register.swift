//
//  UITableView+Register.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit

public extension UITableView {
    typealias UITableViewReusableCell = UITableViewCell & ReusableCell

    func register(_ cells: UITableViewReusableCell.Type...) {
        cells.map { ($0, $0.reuseIdentifier) }
            .forEach(register(_:forCellReuseIdentifier:))
    }

    func registerRegisterableCell<Cell: RegisterableCell>(_ cell: Cell.Type) {
        register(Cell.nib, forCellReuseIdentifier: Cell.reuseIdentifier)
    }
}

