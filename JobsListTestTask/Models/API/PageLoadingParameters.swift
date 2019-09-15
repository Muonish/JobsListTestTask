//
//  PageLoadingParameters.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation

protocol PageLoadingParameters: ParametersConvertable {
    var pageSize: Int { get }
    var pageNum: Int { get set }
}
