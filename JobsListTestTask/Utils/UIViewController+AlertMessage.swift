//
//  UIViewController+AlertMessage.swift
//  JobsListTestTask
//
//  Created by Valeryia Breshko on 9/15/19.
//  Copyright © 2019 Valeria Breshko. All rights reserved.
//

import UIKit

typealias AlertActionHandler = (UIAlertAction) -> Swift.Void

extension UIViewController {
    func showError(_ error: Error?, acceptActionHandler: AlertActionHandler? = nil) {
        guard let error = error else { return }
        showAlert(title: "ERROR", message: error.localizedDescription, acceptActionHandler: acceptActionHandler)
    }

    func showAlert(title: String?, message: String?, acceptActionHandler: AlertActionHandler? = nil) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: acceptActionHandler)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
}
