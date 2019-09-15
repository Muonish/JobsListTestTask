//
//  JobsListProvider.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation
import Alamofire

protocol JobsListProvider {
    func getJobsList(params: PageLoadingParameters, completion: @escaping (Result<JobsListResponce>) -> Void)
}

extension ApiService: JobsListProvider {
    func getJobsList(params: PageLoadingParameters, completion: @escaping (Result<JobsListResponce>) -> Void) {
        let req = request(URLContainer.jobsList, parameters: params.toParameters())
        perform(req, completion: completion)
    }
}
