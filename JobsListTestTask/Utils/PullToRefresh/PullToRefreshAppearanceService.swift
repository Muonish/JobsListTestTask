//
//  PullToRefreshAppearanceService.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import UIKit

protocol PullToRefreshService: class, DataSourceBindable {
    var dataProvidable: DataProvidable? { get }
    func getData(completion: (() -> Void)?)
    func startRefreshing()
    func endRefreshing()
}

extension PullToRefreshService where Self: UIViewController {
    // There are delays added to make teble view updates more smoothly
    func refreshData(completion: (() -> Void)?) {
        startRefreshing()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {  [weak self] in
            self?.getData {
                completion?()
                guard let complete = self?.endRefreshing else { return }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: complete)
            }
        }
    }

    func getData(completion: (() -> Void)?) {
        dataProvidable?.getData(completion: { [weak self] (error) in
            guard error == nil else { completion?(); self?.showError(error); return }
            self?.reloadData()
            completion?()
        })
    }
}

protocol PullToRefreshTableViewService: PullToRefreshService, TableViewBindable {
    var dataProvidable: DataProvidable? { get }
    var refreshControl: UIRefreshControl { get }

    func getData(completion: (() -> Void)?)
}

extension PullToRefreshTableViewService where Self: UIViewController {
    func setupPullToRefresh() {
        tableView.refreshControl = refreshControl
    }

    func scrollToTop(animated: Bool = false) {
        guard numberOfItems(in: 0) > 0 else { return }
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: animated)
    }

    func scrollToBottom(animated: Bool = false) {
        let sectionsNumber = numberOfSections()
        let lastSectionItemsNumber = numberOfItems(in: sectionsNumber - 1)
        guard lastSectionItemsNumber > 0 else { return }
        tableView.scrollToRow(at: IndexPath(row: lastSectionItemsNumber - 1, section: sectionsNumber - 1), at: .middle, animated: animated)
    }

    func startRefreshing() {
        if !refreshControl.isRefreshing {
            scrollToTop()
            DispatchQueue.main.async {
                self.tableView.setContentOffset(CGPoint(x: 0, y: -self.refreshControl.frame.height), animated: false)
                self.refreshControl.beginRefreshing()
            }
        }
    }

    func endRefreshing() {
        refreshControl.endRefreshing()
    }
}

