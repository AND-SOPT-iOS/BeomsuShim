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

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.delegate = self
        contentTextView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateNavigationTitle()
    }

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

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc private func navigateToDetailVC() {
        guard let title = titleTextField.text, !title.isEmpty,
              let content = contentTextView.text, !content.isEmpty
        else {
            showAlertView()
            return
        }

        let vc = DetailViewController()
        vc.bind(title: title, content: content)

        if switchPushMode {
            navigationController?.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        } else {
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.navigationBar.tintColor = .label
            navigationController?.navigationBar.topItem?.title = ""
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

    private func showPlaceholder() {
        if contentTextView.text.isEmpty {
            contentTextView.text = placeholderText
            contentTextView.textColor = UIColor.systemGray3
        }
    }

    private func removePlaceholder() {
        if contentTextView.text == placeholderText {
            contentTextView.text = nil
            contentTextView.textColor = UIColor.label
        }
    }

    private func configureToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let previousButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.up"),
            style: .plain,
            target: self,
            action: #selector(previousField)
        )

        let nextButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.down"),
            style: .plain,
            target: self,
            action: #selector(nextField)
        )

        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )

        let doneButton = UIBarButtonItem(
            title: "키보드 내리기",
            style: .plain,
            target: self,
            action: #selector(dismissKeyboard)
        )

        toolbar.items = [previousButton, nextButton, flexSpace, doneButton]

        titleTextField.inputAccessoryView = toolbar
        contentTextView.inputAccessoryView = toolbar
    }

    private func showAlertView() {
        let alertController = UIAlertController(
            title: "빈값이 있습니다.",
            message: "필드를 모두 채워주세요.",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(okAction)

        present(alertController, animated: true)
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

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        contentTextView.becomeFirstResponder()
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.layer.borderWidth = 1.0
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.borderWidth = 0.5
    }
}

// MARK: - UITextViewDelegate

extension ViewController: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        removePlaceholder()
        textView.layer.borderColor = UIColor.systemBlue.cgColor
        textView.layer.borderWidth = 1.0
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        showPlaceholder()
        textView.layer.borderColor = UIColor.systemGray4.cgColor
        textView.layer.borderWidth = 0.5
    }
}
