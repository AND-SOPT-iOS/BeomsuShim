//
//  AlertDisplayable.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

protocol AlertDisplayable: AnyObject {
    func showAlert(
        title: String,
        message: String,
        actionTitle: String,
        completion: (() -> Void)?
    )
}

extension AlertDisplayable where Self: UIViewController {

    func showAlert(
        title: String,
        message: String,
        actionTitle: String = "OK",
        completion: (() -> Void)? = nil
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: actionTitle, style: .default) { _ in
            completion?()
        }

        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
