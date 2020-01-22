//
//  RegistrableCell.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit

public protocol RegisterableCell: ReusableCell {
    static var nib: UINib { get }
}

public extension RegisterableCell {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: .main)
    }
}

