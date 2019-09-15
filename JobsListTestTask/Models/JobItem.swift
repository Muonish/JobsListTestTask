//
//  JobItem.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation

struct JobItem: Decodable, Equatable {
    let workAssignmentId: String
    let workAssignmentName: String
    let jobLocation: JobLocation

    static func == (lhs: JobItem, rhs: JobItem) -> Bool {
        return lhs.workAssignmentId == rhs.workAssignmentId
    }
}
