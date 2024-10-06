//
//  UIStackView+.swift
//  FirstSeminar
//
//  Created by RAFA on 10/6/24.
//

import UIKit

extension UIStackView {

    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }

    func configureStackView() {
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fillProportionally
        self.spacing = 10
    }
}
