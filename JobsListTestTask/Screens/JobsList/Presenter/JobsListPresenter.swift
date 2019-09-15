//
//  JobsListPresenter.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation

protocol JobsListViewOutput: DataSourceProvider, LoadMore {

}

class JobsListPresenter: JobsListViewOutput, LoadMoreDataProvidable {
    //MARK: - LoadMoreDataProvidable
    typealias DataItem = JobItem
    var data: [JobItem] = []

    var getDataParameters: PageLoadingParameters = JobsListRequestParameters(pageSize: 20, pageNum: 0)
    var canLoadMore: Bool = true

    func getData(parameters: PageLoadingParameters,
                 dataHandler: @escaping ([JobItem]) -> Void,
                 completion: @escaping (ErrorCompletionHandler)) {
        jobsListProvider.getJobsList(params: parameters) { [weak self] (result) in
            switch result {
            case .success(let response):
                dataHandler(response.jobs)
                self?.composeDataSource()
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }

    // MARK: - DataSourceProvider
    var dataSource: DataSource = ArrayDataSource(with: [])

    var view: JobsListViewInput!

    private let jobsListProvider: JobsListProvider

    init(jobsProvider: JobsListProvider = ApiService.default) {
        self.jobsListProvider = jobsProvider
    }

    private func composeDataSource() {
        let models: [JobItemCellModel] = data.map { JobItemCellModel(jobItem: $0) }
        dataSource = ArrayDataSource(with: models)
    }
}
