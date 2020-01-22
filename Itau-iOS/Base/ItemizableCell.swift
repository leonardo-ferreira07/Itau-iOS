//
//  ItemizableCell.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import Foundation

public protocol ItemizableCell: ReusableCell {
    func configure(_ item: Itemizable, at indexPath: IndexPath)
}

public extension ItemizableCell {
    func configure(_ item: Itemizable, at indexPath: IndexPath) { }
}

