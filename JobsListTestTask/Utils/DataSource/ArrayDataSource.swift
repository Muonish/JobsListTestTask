//
//  ArrayDataSource.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation

class ArrayDataSource: DataSource {
    private var items: [Any]

    init(with items: [Any] = []) {
        self.items = items
    }

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfItems(in section: Int) -> Int {
        assert(section == 0, "Section \(section) is out of bounds")
        return items.count
    }

    func item(at indexPath: IndexPath) -> Any {
        assert(indexPath.section == 0, "Section \(indexPath.section) is out of bounds")
        return items[indexPath.item]
    }
}
