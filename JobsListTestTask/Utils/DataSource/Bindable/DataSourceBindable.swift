//
//  DataSourceBindable.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation

protocol DataSourceBindable {
    var dataSourceProvider: DataSourceProvider? { get }
    func reloadData()
}

extension DataSourceBindable {
    func numberOfSections() -> Int {
        return dataSourceProvider?.dataSource.numberOfSections() ?? 0
    }

    func numberOfItems(in section: Int) -> Int {
        return dataSourceProvider?.dataSource.numberOfItems(in: section) ?? 0
    }
}
