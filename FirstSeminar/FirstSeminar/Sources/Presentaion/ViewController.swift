//
//  ViewController.swift
//  FirstSeminar
//
//  Created by RAFA on 10/6/24.
//

import UIKit

final class ViewController: BaseViewController {

    // MARK: - Properties

    private let fadeTextAnimation = CATransition()
    private let switchModeButton = UISwitch()
    private let titleTextField = UITextField()
    private let contentTextView = UITextView()
    private let placeholderText = "내용을 입력해주세요."
    private let nextButton = UIButton(type: .system)
    private let stackView = UIStackView()

    private var switchPushMode: Bool = false

    // MARK: - Actions

    @objc private func switchModeButtonTapped() {
        switchPushMode.toggle()
        applyFadeAnimationToNavigationBar()
        updateNavigationTitle()
    }

    @objc private func previousField() {
        if contentTextView.isFirstResponder {
            titleTextField.becomeFirstResponder()
        }
    }

    @objc private func nextField() {
        if titleTextField.isFirstResponder {
            contentTextView.becomeFirstResponder()
        }
    }

    // MARK: - Helpers

    private func updateNavigationTitle() {
        navigationItem.title = switchPushMode ? "모달" : "내비게이션"
    }

    private func applyFadeAnimationToNavigationBar() {
        fadeTextAnimation.duration = 0.3
        fadeTextAnimation.type = .fade
        navigationController?.navigationBar.layer.add(fadeTextAnimation, forKey: "fadeText")
    }

    // MARK: - UI

    override func setStyle() {
        navigationController?.navigationBar.topItem?.title = "내비게이션"

        switchModeButton.do {
            $0.addTarget(self, action: #selector(switchModeButtonTapped), for: .valueChanged)
        }

        titleTextField.do {
            $0.configureTextInput(placeholder: "제목을 입력해주세요.", fontSize: 25, weight: .bold)
        }

        contentTextView.do {
            $0.configureTextInput(placeholder: nil, fontSize: 17, weight: .medium)
            $0.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        }

        nextButton.do {
            $0.configureButton("다음", titleColor: .black, backgroundColor: .systemYellow)
            $0.addTarget(self, action: #selector(navigateToDetailVC), for: .touchUpInside)
        }

        stackView.do {
            $0.addArrangedSubviews(
                titleTextField,
                contentTextView
            )
            $0.configureStackView()
        }
    }

    override func setUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: switchModeButton)
        view.addSubviews(stackView, nextButton)
        showPlaceholder()
        configureToolbar()
    }

    override func setAutoLayout() {
        titleTextField.snp.makeConstraints { $0.height.equalTo(80) }
        contentTextView.snp.makeConstraints { $0.height.greaterThanOrEqualTo(10) }

        nextButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.keyboardLayoutGuide.snp.top).offset(-5)
            $0.height.equalTo(50)
        }

        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.left.right.equalToSuperview().inset(16)
            $0.bottom.greaterThanOrEqualTo(nextButton.snp.top).offset(-10)
        }
    }
}
