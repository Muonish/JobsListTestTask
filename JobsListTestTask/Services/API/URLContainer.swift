//
//  URLContainer.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation

enum URLContainer {
    private static let base: URL = URL(string: "http://www.coople.com/resources/api")!

    static let jobsList = base.appendingPathComponent("work-assignments/public-jobs/list")
}
