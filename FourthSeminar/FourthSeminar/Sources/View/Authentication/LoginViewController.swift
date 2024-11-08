//
//  LoginViewController.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

final class LoginViewController: BaseViewController {

    // MARK: - Properties

    private let usernameTextField = AuthenticationTextField(placeholder: "이름", isSecure: false)
    private let passwordTextField = AuthenticationTextField(placeholder: "비밀번호", isSecure: true)
    private let loginButton = UIButton(type: .system)
    private let loginStackView = UIStackView()
    private let createAccountButton = UIButton(type: .system)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setAddTargets()
        setDelegates()
        hideKeyboardWhenTappedAround()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: - Actions

    @objc private func loginButtonTapped() {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text,
              !username.isEmpty, !password.isEmpty
        else {
            showAlert(
                title: "⚠️ 빈 값이 있어요! ⚠️",
                message: "모든 필드를 채워주세요! 😊",
                actionTitle: "확인"
            )
            return
        }

        AuthService.login(username: username, password: password) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let token):
                let controller = ViewController(token: token, username: username)
                let navigationController = UINavigationController(rootViewController: controller)
                navigationController.modalPresentationStyle = .fullScreen
                navigationController.navigationBar.prefersLargeTitles = true
                present(navigationController, animated: true)
            case .failure(let error):
                showAlert(
                    title: "로그인 실패 😢",
                    message: error.errorMessage,
                    actionTitle: "확인"
                )
            }
        }
    }

    @objc private func createAccountButtonTapped() {
        let controller = RegistrationViewController()
        controller.title = "회원가입"
        navigationController?.pushViewController(controller, animated: true)
    }

    // MARK: - Helpers

    private func setAddTargets() {
        loginButton.addTarget(
            self,
            action: #selector(loginButtonTapped),
            for: .touchUpInside
        )

        createAccountButton.addTarget(
            self,
            action: #selector(createAccountButtonTapped),
            for: .touchUpInside
        )
    }

    private func setDelegates() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

    // MARK: - UI

    override func setupStyle() {
        loginStackView.do {
            $0.addArrangedSubview(usernameTextField)
            $0.addArrangedSubview(passwordTextField)
            $0.addArrangedSubview(loginButton)
            $0.axis = .vertical
            $0.spacing = 10
        }

        loginButton.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.setTitle("로그인", for: .normal)
            $0.setTitleColor(.systemBackground, for: .normal)
            $0.backgroundColor = .label
        }

        createAccountButton.do {
            $0.attributedTitle(
                firstPart: "계정이 없으신가요? ", .secondaryLabel,
                secondPart: "계정 생성하기", .systemBlue
            )
        }
    }

    override func setupSubviews() {
        view.addSubviews(loginStackView, createAccountButton)
    }

    override func setupConstraints() {
        loginButton.snp.makeConstraints {
            $0.height.equalTo(50)
        }

        loginStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        createAccountButton.snp.makeConstraints {
            $0.centerX.left.equalTo(loginStackView)
            $0.bottom.equalTo(view.keyboardLayoutGuide.snp.top)
        }
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
        }

        return true
    }
}

// MARK: - Protocols

extension LoginViewController: KeyboardDismissible, AlertDisplayable {}
