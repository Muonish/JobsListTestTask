//
//  LoadMore.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation

protocol DataProvidable {
    func getData(completion: @escaping ErrorCompletionHandler)
}

protocol LoadMore: class, DataProvidable {
    var canLoadMore: Bool { get set }
    func loadMore(completion: @escaping ErrorCompletionHandler)
}

protocol LoadMoreDataProvidable: LoadMore {
    associatedtype DataItem: Equatable
    var data: [DataItem] { get set }

    var getDataParameters: PageLoadingParameters { get set }

    func getData(parameters: PageLoadingParameters,
                 dataHandler: @escaping ([DataItem]) -> Void,
                 completion: @escaping (ErrorCompletionHandler))

}

extension LoadMoreDataProvidable {
    func getData(completion: @escaping ErrorCompletionHandler) {
        getDataParameters.pageNum = 0
         let params = getDataParameters
        canLoadMore = false

        let dataHandler: ([DataItem]) -> Void = { [weak self] in
            self?.data = $0
            self?.canLoadMore = $0.count >= params.pageSize
        }

        getData(parameters: params, dataHandler: dataHandler, completion: { (error) in
            DispatchQueue.main.async {
                completion(error)
            }
        })
    }

    func loadMore(completion: @escaping ErrorCompletionHandler) {
        let initialItemsNumber = data.count
        getDataParameters.pageNum += 1
        let params = getDataParameters
        canLoadMore = false

        let dataHandler: ([DataItem]) -> Void = { [weak self] in
            guard initialItemsNumber == self?.data.count else { return } // if getData was called after loadMore
            let newUniqueItems = $0.filter { self?.data.contains($0) == false }
            self?.data.append(contentsOf: newUniqueItems)
            self?.canLoadMore = $0.count >= params.pageSize
        }
        getData(parameters: params, dataHandler: dataHandler, completion: { (error) in
            DispatchQueue.main.async {
                completion(error)
            }
        })
    }
}
