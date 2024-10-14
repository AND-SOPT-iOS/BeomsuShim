//
//  EditNicknameViewController.swift
//  SecondSeminar
//
//  Created by RAFA on 10/14/24.
//

import UIKit

final class EditNicknameViewController: BaseViewController {

    // MARK: - Properties

    private let nicknameTitleLabel = UILabel()
    private let nicknameTextField = UITextField()
    private let nicknameTextInputView = UIView()
    private let descriptionLabel = UILabel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBarStyle()
    }

    // MARK: - Actions

    @objc private func updateButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - UI

    private func setNavigationBarStyle() {
        let updateButton = UIButton(type: .system).then {
            $0.setTitle("업데이트", for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            $0.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        }

        let updateBarButtonItem = UIBarButtonItem(customView: updateButton)

        navigationItem.rightBarButtonItem = updateBarButtonItem
    }

    override func setStyle() {
        nicknameTitleLabel.do {
            $0.text = "별명"
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
        }

        nicknameTextField.do {
            $0.placeholder = "별명"
            $0.backgroundColor = .clear
            $0.font = .systemFont(ofSize: 15, weight: .regular)
            $0.autocorrectionType = .no
            $0.autocapitalizationType = .none
            $0.spellCheckingType = .no
            $0.clearButtonMode = .whileEditing
        }

        nicknameTextInputView.do {
            $0.backgroundColor = .tertiarySystemGroupedBackground
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }

        descriptionLabel.do {
            $0.text = "App Store, Apple 팟캐스트 및 Apple Books에서 제출하는 모든 리뷰에 표시할 별명을 업데이트하십시오."
            $0.textColor = .systemGray
            $0.textAlignment = .left
            $0.numberOfLines = 0
            $0.font = .systemFont(ofSize: 12, weight: .medium)
        }
    }

    override func setUI() {
        view.addSubviews(nicknameTextInputView, descriptionLabel)
        nicknameTextInputView.addSubviews(nicknameTitleLabel, nicknameTextField)
    }

    override func setLayout() {
        nicknameTextInputView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.left.right.equalToSuperview().inset(20)
        }

        nicknameTitleLabel.snp.makeConstraints {
            $0.top.equalTo(15)
            $0.left.equalTo(15)
            $0.bottom.equalTo(-15)
            $0.width.equalTo(40)
        }

        nicknameTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(nicknameTitleLabel.snp.right).offset(30)
            $0.right.equalTo(-20)
            $0.height.equalTo(40)
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameTextInputView.snp.bottom).offset(20)
            $0.left.right.equalTo(nicknameTextInputView).inset(20)
        }
    }
}
