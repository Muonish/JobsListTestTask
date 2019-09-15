//
//  JobsListViewController.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import UIKit

protocol JobsListViewInput: DataSourceBindable {
    func setLoadingIndicator(visible: Bool)
}

class JobsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    let footerActivityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        view.style = .gray
        return view
    }()
    
    var presenter: JobsListViewOutput = JobsListPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells([JobItemTableViewCell.self])
        tableView.tableFooterView = UIView(frame: .zero)
        addRefreshControl()
        refresh(refreshControl)
    }

    private func addRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        setupPullToRefresh()
    }

    @objc func refresh(_ refreshControl: UIRefreshControl) {
        refreshData {

        }
    }
}

extension JobsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dequeueBindedReusableCell(at: indexPath)
    }
}

extension JobsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        loadMoreIfNeeded(for: indexPath)
    }
}

extension JobsListViewController: TableViewBindable {
    var dataSourceProvider: DataSourceProvider? {
        return presenter
    }
}

extension JobsListViewController: LoadMoreAppearanceService {
    var loadMoreProvidable: LoadMore? {
        return presenter
    }

    var indicatorTableView: UITableView {
        return tableView
    }
}

extension JobsListViewController: PullToRefreshTableViewService {
    var dataProvidable: DataProvidable? {
        return presenter
    }
}
