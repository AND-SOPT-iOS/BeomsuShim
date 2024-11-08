//
//  UIButton+.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

extension UIButton {

    func attributedTitle(
        firstPart: String,
        _ firstPartColor: UIColor,
        secondPart: String,
        _ secondPartColor: UIColor
    ) {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: firstPartColor
        ]

        let attributedTitle = NSMutableAttributedString(
            string: "\(firstPart)",
            attributes: attributes
        )

        let boldString: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor: secondPartColor
        ]

        attributedTitle.append(NSAttributedString(string: secondPart, attributes: boldString))
        setAttributedTitle(attributedTitle, for: .normal)
    }
}

