//
//  UIView+.swift
//  FirstSeminar
//
//  Created by RAFA on 10/6/24.
//

import UIKit

protocol TextInputConfigurable {

    func configureTextInput(placeholder: String?, fontSize: CGFloat, weight: UIFont.Weight)
}

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

extension TextInputConfigurable where Self: UIView {

    func configureTextInput(placeholder: String?, fontSize: CGFloat, weight: UIFont.Weight) {
        if let textField = self as? UITextField {
            configureTextField(
                textField,
                placeholder: placeholder,
                fontSize: fontSize,
                weight: weight
            )
        } else if let textView = self as? UITextView {
            configureTextView(textView, fontSize: fontSize, weight: weight)
        }

        self.layer.cornerRadius = 15
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.systemGray4.cgColor
        self.clipsToBounds = true
    }

    private func configureTextField(
        _ textField: UITextField,
        placeholder: String?,
        fontSize: CGFloat,
        weight: UIFont.Weight
    ) {
        textField.font = .systemFont(ofSize: fontSize, weight: weight)
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        configureCommonProperties(for: textField)
    }

    private func configureTextView(
        _ textView: UITextView,
        fontSize: CGFloat,
        weight: UIFont.Weight
    ) {
        textView.font = .systemFont(ofSize: fontSize, weight: weight)
        configureCommonProperties(for: textView)
    }

    private func configureCommonProperties(for view: UIView) {
        if let textField = view as? UITextField {
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
            textField.spellCheckingType = .no
            textField.tintColor = .label
        } else if let textView = view as? UITextView {
            textView.autocorrectionType = .no
            textView.autocapitalizationType = .none
            textView.spellCheckingType = .no
            textView.tintColor = .label
        }
    }
}

extension UITextField: TextInputConfigurable {}
extension UITextView: TextInputConfigurable {}
