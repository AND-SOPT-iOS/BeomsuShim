//
//  DetailViewController.swift
//  FirstSeminar
//
//  Created by RAFA on 10/6/24.
//

import UIKit

final class DetailViewController: BaseViewController {

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    private let backButton = UIButton(type: .system)
    private let stackView = UIStackView()

    private var receivedTitle: String?
    private var receivedContent: String?

    // MARK: - Actions

    @objc private func backButtonTapped() {
        guard let navigationController = navigationController else {
            dismiss(animated: true)
            return
        }

        navigationController.popViewController(animated: true)
    }

    // MARK: - Bindings

    func bind(title: String, content: String) {
        receivedTitle = title
        receivedContent = content
        titleLabel.text = receivedTitle
        contentLabel.text = receivedContent
    }

    // MARK: - UI

    override func setStyle() {
        titleLabel.do { $0.configureLabel(ofSize: 25, weight: .bold) }
        contentLabel.do { $0.configureLabel(ofSize: 17, weight: .medium) }

        backButton.do {
            $0.configureButton("이전 화면으로", titleColor: .systemBackground, backgroundColor: .label)
            $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        }

        stackView.do {
            $0.addArrangedSubviews(titleLabel, contentLabel, backButton)
            $0.configureStackView()
        }
    }

    override func setUI() { view.addSubview(stackView) }

    override func setAutoLayout() {
        backButton.snp.makeConstraints { $0.height.equalTo(50) }
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
}
