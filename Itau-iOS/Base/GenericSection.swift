//
//  GenericSection.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import RxDataSources

public struct GenericSection {
    public var title: String?
    public var items: [Item]

    public init(title: String? = nil, items: [Item]) {
        self.title = title
        self.items = items
    }
}

extension GenericSection: SectionModelType {
    public typealias Item = ItemizableViewModel

    public init(original: GenericSection, items: [Item]) {
        self = original
        self.items = items
    }
}

