//
//  UILabel+.swift
//  SecondSeminar
//
//  Created by RAFA on 10/15/24.
//

import UIKit

extension UILabel {

    func configureLabel(
        _ text: String,
        color: UIColor? = .label,
        alignment: NSTextAlignment? = .left,
        size: CGFloat,
        weight: UIFont.Weight,
        numberOfLines: Int? = 0
    ) {
        self.text = text
        textColor = color
        textAlignment = alignment ?? .left
        font = .systemFont(ofSize: size, weight: weight)
        self.numberOfLines = numberOfLines ?? 0
    }
}
