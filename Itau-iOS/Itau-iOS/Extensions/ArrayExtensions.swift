//
//  ArrayExtensions.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 31/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}
