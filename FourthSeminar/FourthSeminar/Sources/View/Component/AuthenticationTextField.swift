//
//  AuthenticationTextField.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

import SnapKit

final class AuthenticationTextField: UITextField {

    // MARK: - Properties

    override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }

    // MARK: - Initializer

    init(placeholder: String, isSecure: Bool) {
        super.init(frame: .zero)

        configureTextField(with: placeholder, isSecure: isSecure)
        applyLeftView()
        setupConstraints()

        if isSecure {
            applyRightView()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions

    @objc private func togglePasswordVisibility() {
        isSecureTextEntry.toggle()

        if let eyeButton = rightView as? UIButton {
            let icon = isSecureTextEntry ? "eye.slash" : "eye"
            eyeButton.setImage(UIImage(systemName: icon), for: .normal)
        }
    }

    // MARK: - Helpers

    @discardableResult
    override func becomeFirstResponder() -> Bool {
        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let text = self.text {
            self.text?.removeAll()
            insertText(text)
        }

        return success
    }

    // MARK: - UI

    private func configureTextField(with placeholder: String, isSecure: Bool) {
        textColor = .label
        tintColor = .label
        borderStyle = .none
        layer.cornerRadius = 10
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.borderWidth = 0.7
        keyboardAppearance = .dark
        keyboardType = .emailAddress
        backgroundColor = .systemBackground
        spellCheckingType = .no
        autocorrectionType = .no
        autocapitalizationType = .none

        isSecureTextEntry = isSecure

        if isSecure {
            textContentType = .newPassword
        }

        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: UIColor.systemGray]
        )
    }

    private func applyLeftView() {
        let spacer = UIView(frame: .init(x: 0, y: 0, width: 12, height: 50))
        leftView = spacer
        leftViewMode = .always
    }

    private func applyRightView() {
        let eyeButton = UIButton(type: .system)
        eyeButton.tintColor = .label

        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "eye.slash")
        config.imagePadding = 10

        eyeButton.configuration = config
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        rightView = eyeButton
        rightViewMode = .always
    }

    private func setupConstraints() {
        snp.makeConstraints { $0.height.equalTo(50) }
    }
}
