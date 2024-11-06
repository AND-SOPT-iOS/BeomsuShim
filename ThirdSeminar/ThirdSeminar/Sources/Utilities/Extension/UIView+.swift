//
//  UIView+.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/27/24.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }

    func configureDivider() {
        backgroundColor = .systemGray2
    }
}
