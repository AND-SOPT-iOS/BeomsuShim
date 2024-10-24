//
//  UIButton+.swift
//  SecondSeminar
//
//  Created by RAFA on 10/17/24.
//

import UIKit

extension UIButton {

    func configureButton(
        title: String? = nil,
        fontSize: CGFloat? = 17,
        fontWeight: UIFont.Weight? = .medium,
        foregroundColor: UIColor? = .label,
        imageName: String? = nil,
        tintColor: UIColor? = .systemBlue,
        pointSize: CGFloat? = 17,
        imageWeight: UIImage.SymbolWeight? = .medium,
        imagePlacement: NSDirectionalRectEdge? = .leading,
        imagePadding: CGFloat? = 5
    ) {
        guard let title = title,
              let fontSize = fontSize,
              let fontWeight = fontWeight
        else {
            return
        }

        guard let imageName = imageName,
              let tintColor = tintColor,
              let pointSize = pointSize,
              let imageWeight = imageWeight,
              let imagePlacement = imagePlacement,
              let imagePadding = imagePadding
        else {
            return
        }
        
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString(
            NSAttributedString(
                string: title,
                attributes: [
                    .font: UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
                ]
            )
        )
        config.baseForegroundColor = foregroundColor
        config.image = UIImage(systemName: imageName)?
            .withTintColor(tintColor, renderingMode: .alwaysOriginal)
            .withConfiguration(
                UIImage.SymbolConfiguration(
                    pointSize: pointSize,
                    weight: imageWeight
                )
            )
        config.imagePlacement = imagePlacement
        config.imagePadding = imagePadding
        config.contentInsets = .zero

        self.configuration = config
    }
}
