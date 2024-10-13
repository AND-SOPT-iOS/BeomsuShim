//
//  UIView+.swift
//  FirstSeminar
//
//  Created by RAFA on 10/6/24.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }

    func configureTextInput(placeholder: String?, fontSize: CGFloat, weight: UIFont.Weight) {
        if let textField = self as? UITextField {
            textField.font = .systemFont(ofSize: fontSize, weight: weight)
            textField.borderStyle = .roundedRect
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
            textField.spellCheckingType = .no
            textField.tintColor = .label
            textField.placeholder = placeholder
            textField.borderStyle = .roundedRect
        } else if let textView = self as? UITextView {
            textView.font = .systemFont(ofSize: fontSize, weight: weight)
            textView.autocorrectionType = .no
            textView.autocapitalizationType = .none
            textView.spellCheckingType = .no
        }

        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.systemGray4.cgColor
    }
}
