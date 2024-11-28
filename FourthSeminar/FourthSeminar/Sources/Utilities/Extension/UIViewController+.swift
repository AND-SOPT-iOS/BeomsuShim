//
//  UIViewController+.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

extension UIViewController {

    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func handleDismissal() {
        view.endEditing(true)
    }
}
