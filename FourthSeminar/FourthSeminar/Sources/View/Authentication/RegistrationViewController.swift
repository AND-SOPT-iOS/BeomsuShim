//
//  RegistrationViewController.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

final class RegistrationViewController: BaseViewController {

    // MARK: - Properties

    private var textFields: [UITextField] = []
    private let usernameTextField = AuthenticationTextField(
        placeholder: "이름",
        isSecure: false
    )

    private let passwordTextField = AuthenticationTextField(
        placeholder: "비밀번호",
        isSecure: true
    )

    private let confirmPasswordTextField = AuthenticationTextField(
        placeholder: "비밀번호 확인",
        isSecure: true
    )

    private let hobbyTextField = AuthenticationTextField(
        placeholder: "취미가 무엇인가요?",
        isSecure: false
    )

    private let signUpButton = UIButton(type: .system)
    private let credentialsStackView = UIStackView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setAddTargets()
        setDelegates()
        setupNavigationBar()
        setupBackButton()
        hideKeyboardWhenTappedAround()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    // MARK: - Actions

    @objc private func signUpButtonTapped() {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text,
              let confirmPassword = confirmPasswordTextField.text,
              let hobby = hobbyTextField.text,
              !username.isEmpty, !password.isEmpty, !confirmPassword.isEmpty, !hobby.isEmpty
        else {
            showAlert(
                title: "⚠️ 빈 값이 있어요! ⚠️",
                message: "모든 필드를 채워주세요! 😊",
                actionTitle: "확인"
            )
            return
        }

        guard password == confirmPassword else {
            showAlert(
                title: "⚠️ 비밀번호 불일치 ⚠️",
                message: "비밀번호가 일치하지 않습니다. 다시 확인해 주세요.",
                actionTitle: "확인"
            )
            return
        }

        AuthService.register(
            username: username,
            password: password,
            hobby: hobby
        ) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success:
                self.showAlert(
                    title: "회원가입 성공 🎉",
                    message: "회원가입이 완료되었습니다. 로그인 화면으로 돌아갑니다.",
                    actionTitle: "확인"
                ) {
                    self.navigationController?.popViewController(animated: true)
                }
            case .failure(let error):
                self.showAlert(
                    title: "회원가입 실패 😢",
                    message: error.errorMessage,
                    actionTitle: "확인"
                )
            }
        }
    }

    // MARK: - Helpers

    private func setAddTargets() {
        signUpButton.addTarget(
            self,
            action: #selector(signUpButtonTapped),
            for: .touchUpInside
        )
    }

    private func setDelegates() {
        textFields = [
            usernameTextField,
            passwordTextField,
            confirmPasswordTextField,
            hobbyTextField
        ]

        textFields.forEach { $0.delegate = self }
    }

    // MARK: - UI

    override func setupStyle() {
        credentialsStackView.do {
            $0.addArrangedSubview(usernameTextField)
            $0.addArrangedSubview(passwordTextField)
            $0.addArrangedSubview(confirmPasswordTextField)
            $0.addArrangedSubview(hobbyTextField)
            $0.addArrangedSubview(signUpButton)
            $0.axis = .vertical
            $0.spacing = 10
        }

        signUpButton.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.setTitle("회원가입", for: .normal)
            $0.setTitleColor(.systemBackground, for: .normal)
            $0.backgroundColor = .label
        }
    }

    override func setupSubviews() {
        view.addSubview(credentialsStackView)
    }

    override func setupConstraints() {
        signUpButton.snp.makeConstraints {
            $0.height.equalTo(50)
        }

        credentialsStackView.snp.makeConstraints {
            $0.center.lessThanOrEqualToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.lessThanOrEqualTo(view.keyboardLayoutGuide.snp.top).offset(-20)
        }
    }
}

// MARK: - UITextFieldDelegate

extension RegistrationViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField: passwordTextField.becomeFirstResponder()
        case passwordTextField: confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField: hobbyTextField.becomeFirstResponder()
        case hobbyTextField: hobbyTextField.resignFirstResponder()
        default: usernameTextField.becomeFirstResponder()
        }

        return true
    }
}


// MARK: - Protocols

extension RegistrationViewController:
    NavigationConfigurable,
    KeyboardDismissible,
    AlertDisplayable {}
