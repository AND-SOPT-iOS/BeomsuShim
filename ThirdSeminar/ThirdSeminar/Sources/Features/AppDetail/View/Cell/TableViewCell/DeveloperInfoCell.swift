//
//  DeveloperInfoCell.swift
//  ThirdSeminar
//
//  Created by RAFA on 11/1/24.
//

import UIKit

final class DeveloperInfoCell: BaseTableViewCell {

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let titleStackView = UIStackView()
    private let arrowImageView = UIImageView()

    // MARK: - UI

    override func setupStyle() {
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
            $0.configureStackView(
                addArrangedSubviews: titleLabel, subtitleLabel,
                alignment: .leading,
                distribution: .fillProportionally,
                spacing: 2
            )
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

    override func setupSubviews() {
        contentView.addSubviews(titleStackView, arrowImageView)
    }

    override func setupConstraints() {
        titleStackView.snp.makeConstraints {
            $0.top.equalTo(40)
            $0.left.equalTo(20)
            $0.bottom.equalTo(-20)
        }

        arrowImageView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel).offset(10)
            $0.right.equalTo(-20)
        }
    }
}
