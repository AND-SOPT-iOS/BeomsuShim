//
//  DeveloperNameButton.swift
//  SecondSeminar
//
//  Created by RAFA on 10/13/24.
//

import UIKit

import SnapKit
import Then

final class DeveloperNameButton: UIView {

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let titleStackView = UIStackView()
    private let arrowImageView = UIImageView()
    private let button = UIButton(type: .system)

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)

        setStyle()
        setUI()
        setLayout()
        setActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI

    private func setStyle() {
        titleLabel.do {
            $0.text = "Viva Republica"
            $0.font = .systemFont(ofSize: 14, weight: .medium)
            $0.textColor = .systemBlue
            $0.textAlignment = .left
        }

        subtitleLabel.do {
            $0.text = "개발자"
            $0.font = .systemFont(ofSize: 14, weight: .medium)
            $0.textColor = .systemGray
            $0.textAlignment = .left
        }

        titleStackView.do {
            $0.addArrangedSubview(titleLabel)
            $0.addArrangedSubview(subtitleLabel)
            $0.axis = .vertical
            $0.alignment = .leading
            $0.distribution = .fillProportionally
            $0.spacing = 2
        }

        arrowImageView.do {
            $0.image = UIImage(systemName: "chevron.right")?
                .withConfiguration(
                    UIImage.SymbolConfiguration(
                        pointSize: 17,
                        weight: .medium
                    )
                )
            $0.tintColor = .systemGray
        }
    }

    private func setUI() {
        addSubview(titleStackView)
        addSubview(arrowImageView)
        addSubview(button)
    }

    private func setLayout() {
        titleStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview()
        }

        arrowImageView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel).offset(10)
            $0.right.equalToSuperview()
        }

        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: - Actions

    private func setActions() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped() {
        print("Button tapped!")
    }
}
