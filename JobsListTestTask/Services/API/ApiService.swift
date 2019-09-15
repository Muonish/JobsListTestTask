//
//  ApiService.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation
import Alamofire

final class ApiService {

    static let `default` = ApiService()
    private init() {}

    func perform<T: Decodable>(_ request: DataRequest, completion: @escaping (Result<T>) -> Void) {
        request.responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let result: T = try JSONDecoder().decode(T.self, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(error))
                }
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }

}
