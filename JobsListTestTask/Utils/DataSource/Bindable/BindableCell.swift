//
//  BindableCell.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation

protocol BindableCellViewModel {
    var cellClass: Reusable.Type { get }
}

protocol BindableCell: Reusable {
    func setup(with viewModel: BindableCellViewModel)
}
