//
//  UILabel+.swift
//  FirstSeminar
//
//  Created by RAFA on 10/6/24.
//

import UIKit

extension UILabel {

    func configureLabel(ofSize: CGFloat, weight: UIFont.Weight) {
        self.textColor = .label
        self.textAlignment = .left
        self.numberOfLines = 0
        self.font = .systemFont(ofSize: ofSize, weight: weight)
    }
}
