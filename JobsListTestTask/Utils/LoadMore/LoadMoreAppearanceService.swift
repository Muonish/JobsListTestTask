//
//  LoadMoreAppearanceService.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import UIKit

protocol LoadMoreAppearanceService: class, DataSourceBindable, TableViewFooterActivityIndicatorService {
    var loadMoreProvidable: LoadMore? { get }
}

extension LoadMoreAppearanceService where Self: UIViewController {
    func loadMoreIfNeeded(for indexPath: IndexPath) {
        let lastSection = numberOfSections() - 1
        guard numberOfSections() > 0, indexPath.item == numberOfItems(in: lastSection) - 1 else { return }
        guard loadMoreProvidable?.canLoadMore == true else { return }
        loadMore()
    }

    func loadMore() {
        showFooterActivityIndicator(true, animated: false)
        loadMoreProvidable?.loadMore(completion: { [weak self] (error) in
            guard error == nil else { self?.showError(error); return}
            self?.showFooterActivityIndicator(false, animated: true)
            self?.reloadData()
        })
    }
}
