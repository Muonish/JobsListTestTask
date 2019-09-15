//
//  TableViewFooterActivityIndicatorService.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import UIKit

protocol TableViewFooterActivityIndicatorService {
    var indicatorTableView: UITableView { get }
    var footerActivityIndicator: UIActivityIndicatorView { get }
}

extension TableViewFooterActivityIndicatorService {

    func setupFooterActivityIndicator() {
        footerActivityIndicator.style = .gray
        footerActivityIndicator.hidesWhenStopped = true
        footerActivityIndicator.clipsToBounds = true
        indicatorTableView.tableFooterView = footerActivityIndicator
    }

    func showFooterActivityIndicator(_ isVisible: Bool, animated: Bool = true) {
        guard footerActivityIndicator.isAnimating != isVisible else {
            return
        }
        if isVisible {
            footerActivityIndicator.startAnimating()
        } else {
            footerActivityIndicator.stopAnimating()
        }
        let updateTableFooterView = {
            self.footerActivityIndicator.frame.size = CGSize(width: self.indicatorTableView.bounds.width,
                                                             height: isVisible ? 44 : 0)
            self.indicatorTableView.tableFooterView = self.footerActivityIndicator
            self.indicatorTableView.setNeedsLayout()
            self.indicatorTableView.layoutIfNeeded()
        }
        if animated {
            UIView.animate(withDuration: 0.3, animations: updateTableFooterView)
        } else {
            updateTableFooterView()
        }
    }

}
