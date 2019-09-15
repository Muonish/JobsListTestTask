//
//  TableViewBindable.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import UIKit

protocol TableViewBindable: DataSourceBindable {
    var tableView: UITableView! { get }
}

extension TableViewBindable {
    func registerCells(_ cellClasses: [Reusable.Type]) {
        cellClasses.forEach { (type) in
            self.tableView.register(type.nib, forCellReuseIdentifier: type.reuseIdentifier)
        }
    }

    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func dequeueBindedReusableCell(at indexPath: IndexPath) -> UITableViewCell {
        guard let model = dataSourceProvider?.dataSource.item(at: indexPath) as? BindableCellViewModel,
            let bindableCell = tableView.dequeueReusableCell(withIdentifier: model.cellClass.reuseIdentifier, for: indexPath) as? BindableCell else {
                return UITableViewCell()
        }
        bindableCell.setup(with: model)
        return (bindableCell as? UITableViewCell) ?? UITableViewCell()
    }
}
