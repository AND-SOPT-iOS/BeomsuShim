//
//  SettingViewController.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

final class SettingViewController: BaseViewController {

    // MARK: - Properties

    private let hobbyTextField = AuthenticationTextField(
        placeholder: "새로운 취미",
        isSecure: false
    )
    private let passwordTextField = AuthenticationTextField(
        placeholder: "새로운 비밀번호",
        isSecure: true
    )
    private let updateButton = UIButton(type: .system)
    private let updateUserInfoStackView = UIStackView()
    private let logoutButton = UIButton(type: .system)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setAddTargets()
        hideKeyboardWhenTappedAround()
    }

    // MARK: - Actions

    @objc private func updateInfoTapped() {
        guard let hobby = hobbyTextField.text,
              let password = passwordTextField.text,
              !hobby.isEmpty || !password.isEmpty
        else {
            showAlert(title: "오류", message: "하나 이상의 필드를 입력해 주세요.", actionTitle: "확인")
            return
        }

        guard let token = TokenManager.shared.getToken() else {
            showAlert(title: "오류", message: "로그인이 필요합니다.", actionTitle: "확인")
            return
        }

        UserService.updateUserInfo(
            hobby: hobby,
            password: password,
            token: token
        ) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success:
                NotificationCenter.default.post(
                    name: Notification.Name("HobbyUpdated"),
                    object: nil,
                    userInfo: ["hobby": hobby]
                )
                self.showAlert(
                    title: "성공",
                    message: "정보가 업데이트되었습니다.",
                    actionTitle: "확인"
                )
            case .failure(let error):
                self.showAlert(
                    title: "오류",
                    message: error.localizedDescription,
                    actionTitle: "확인"
                )
            }
        }
    }

    @objc private func logoutTapped() {
        TokenManager.shared.clearToken()

        let loginViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }

    // MARK: - Helpers

    private func setAddTargets() {
        updateButton.addTarget(self, action: #selector(updateInfoTapped), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    }

    // MARK: - UI

    override func setupStyle() {
        updateButton.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.setTitle("정보 업데이트", for: .normal)
            $0.setTitleColor(.systemBackground, for: .normal)
            $0.backgroundColor = .label
        }

        logoutButton.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.setTitle("로그아웃", for: .normal)
            $0.setTitleColor(.systemBackground, for: .normal)
            $0.backgroundColor = .systemRed
        }

        updateUserInfoStackView.do {
            $0.addArrangedSubview(hobbyTextField)
            $0.addArrangedSubview(passwordTextField)
            $0.addArrangedSubview(updateButton)
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 10
        }
    }

    override func setupSubviews() {
        view.addSubviews(
            updateUserInfoStackView,
            logoutButton
        )
    }

    override func setupConstraints() {
        hobbyTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }

        updateUserInfoStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        logoutButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.height.equalTo(50)
        }
    }
}

// MARK: - Protocols

extension SettingViewController: AlertDisplayable, KeyboardDismissible {}
