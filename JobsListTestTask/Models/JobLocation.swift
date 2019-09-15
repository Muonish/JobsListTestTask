//
//  JobLocation.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import Foundation

struct JobLocation: Decodable {
    let addressStreet: String
    let zip: String
    let city: String
}
