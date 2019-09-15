//
//  JobItemTableViewCell.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import UIKit

struct JobItemCellModel: BindableCellViewModel {
    let cellClass: Reusable.Type = JobItemTableViewCell.self

    let jobItem: JobItem
}

class JobItemTableViewCell: UITableViewCell, BindableCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var streetLabel: UILabel!
    @IBOutlet private weak var zipLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!

    func setup(with viewModel: BindableCellViewModel) {
        guard let model = viewModel as? JobItemCellModel else { return }
        nameLabel.text = model.jobItem.workAssignmentName
        streetLabel.text = model.jobItem.jobLocation.addressStreet
        zipLabel.text = model.jobItem.jobLocation.zip
        cityLabel.text = model.jobItem.jobLocation.city
    }
}
