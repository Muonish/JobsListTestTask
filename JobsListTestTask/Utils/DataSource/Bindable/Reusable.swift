//
//  Reusable.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import UIKit

protocol Reusable: class {
    static var nib: UINib { get }
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var nib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: nil)
    }

    static var reuseIdentifier: String {
        return String(describing: Self.self) + "Identifier"
    }
}

