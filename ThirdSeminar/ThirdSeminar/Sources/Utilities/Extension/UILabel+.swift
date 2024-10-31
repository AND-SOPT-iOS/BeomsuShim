//
//  UILabel+.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/31/24.
//

import UIKit

extension UILabel {

    func configureLabel(
        _ text: String,
        color: UIColor? = .label,
        alignment: NSTextAlignment? = .left,
        size: CGFloat,
        weight: UIFont.Weight,
        numberOfLines: Int? = 1
    ) {
        self.text = text
        textColor = color
        textAlignment = alignment ?? .left
        font = .systemFont(ofSize: size, weight: weight)
        self.numberOfLines = numberOfLines ?? 1
    }

    func applyParagraphStyle(
        text: String,
        lineBreakMode: NSLineBreakMode? = .byTruncatingTail,
        numberOfLines: Int? = 0
    ) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4

        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: UIFont.systemFont(ofSize: 14, weight: .regular)
            ]
        )

        self.attributedText = attributedString
        self.lineBreakMode = lineBreakMode ?? .byTruncatingTail
        self.textAlignment = .left
        self.numberOfLines = numberOfLines ?? 0
    }
}
