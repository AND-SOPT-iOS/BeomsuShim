//
//  UIView+.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
