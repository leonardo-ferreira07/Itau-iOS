//
//  RxGenericTableViewDataSource.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import RxDataSources

public class RxGenericTableViewDataSource: RxTableViewSectionedReloadDataSource<GenericSection> {
    public convenience init() {
        self.init(configureCell: { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
            (cell as? ItemizableCell)?.configure(item, at: indexPath)

            return cell
        })
    }
}
