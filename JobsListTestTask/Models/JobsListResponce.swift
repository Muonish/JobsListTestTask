//
//  JobsListResponce.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation

struct JobsListResponce: Decodable {
    private struct Data: Decodable {
        let items: [JobItem]
        let total: Int
    }

    private let data: Data
    let error: Bool
    let errorCode: String

    var jobs: [JobItem] {
        return data.items
    }
}
