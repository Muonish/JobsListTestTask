//
//  JobsListRequestParameters.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation

struct JobsListRequestParameters: Encodable, PageLoadingParameters {
    let pageSize: Int
    var pageNum: Int

    func toParameters() -> [String: Any] {
        return [CodingKeys.pageNum.stringValue: pageNum,
                CodingKeys.pageSize.stringValue: pageSize]
    }
}
