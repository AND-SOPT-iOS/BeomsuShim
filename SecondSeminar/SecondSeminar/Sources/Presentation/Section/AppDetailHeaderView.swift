//
//  AppDetailHeaderView.swift
//  SecondSeminar
//
//  Created by RAFA on 10/13/24.
//

import UIKit

final class AppDetailHeaderView: BaseView {

    // MARK: - Properties

    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let titleStackView = UIStackView()
    private let installButton = UIButton(type: .system)
    private let shareButton = UIButton(type: .system)

    // MARK: - UI

    override func setStyle() {
        iconImageView.do {
            $0.image = UIImage(named: "icon")
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor.systemGray4.cgColor
        }

        titleLabel.do {
            $0.text = "토스"
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 20, weight: .semibold)
        }

        subtitleLabel.do {
            $0.text = "금융이 쉬워진다"
            $0.textColor = .systemGray
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 14, weight: .semibold)
        }

        titleStackView.do {
            $0.addArrangedSubview(titleLabel)
            $0.addArrangedSubview(subtitleLabel)
            $0.axis = .vertical
            $0.alignment = .leading
            $0.distribution = .fillProportionally
            $0.spacing = 3
        }

        installButton.do {
            $0.backgroundColor = .systemBlue
            $0.setAttributedTitle(
                NSAttributedString(
                    string: "받기",
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 15, weight: .bold),
                        .foregroundColor: UIColor.white
                    ]
                ),
                for: .normal
            )
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }

        shareButton.do {
            $0.setImage(UIImage(systemName: "square.and.arrow.up")?
                .withConfiguration(UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
        }
    }

    override func setUI() {
        addSubviews(iconImageView, titleStackView, installButton, shareButton)
    }

    override func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.top.left.bottom.equalToSuperview()
            $0.size.equalTo(120)
        }

        titleStackView.snp.makeConstraints {
            $0.top.equalTo(iconImageView)
            $0.left.equalTo(iconImageView.snp.right).offset(15)
            $0.right.equalTo(-20)
        }

        installButton.snp.makeConstraints {
            $0.left.equalTo(titleStackView)
            $0.bottom.equalTo(iconImageView)
            $0.width.equalTo(80)
            $0.height.equalTo(30)
        }

        shareButton.snp.makeConstraints {
            $0.centerY.equalTo(installButton)
            $0.right.equalToSuperview()
            $0.size.equalTo(30)
        }
    }
}
