//
//  UIView+.swift
//  SecondSeminar
//
//  Created by RAFA on 10/13/24.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
