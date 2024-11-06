//
//  BaseItemCell.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/31/24.
//

import UIKit

class BaseItemCell: BaseCollectionViewCell {

    // MARK: - Properties

    private let appIconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let appInfoView = UIStackView()
    private let installButton = UIButton(type: .system)
    private let inAppPurchasesLabel = UILabel()

    // MARK: - Helpers

    func configure(_ item: Item) {
        appIconImageView.image = UIImage(named: item.appIcon)
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        updateInstallButtonTitle(for: item)
        inAppPurchasesLabel.isHidden = !item.hasInAppPurchases
    }

    private func updateInstallButtonTitle(for item: Item) {
        installButton.setAttributedTitle(nil, for: .normal)
        installButton.setImage(nil, for: .normal)
        installButton.backgroundColor = .clear

        switch item.downloadState {
        case .paid:
            guard let price = item.price else { return }
            installButton.setAttributedTitle(
                NSAttributedString(
                    string: "₩\(price)",
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 13, weight: .bold)
                    ]
                ),
                for: .normal
            )

            installButton.backgroundColor = .tertiarySystemGroupedBackground
        case .reinstall:
            installButton.setImage(
                UIImage(systemName: "icloud.and.arrow.down")?
                    .withConfiguration(UIImage.SymbolConfiguration(pointSize: 13, weight: .bold)),
                for: .normal
            )

            installButton.backgroundColor = .clear
        default:
            installButton.setAttributedTitle(
                NSAttributedString(
                    string: item.downloadState.buttonTitle,
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 13, weight: .bold)
                    ]
                ),
                for: .normal
            )

            installButton.backgroundColor = .tertiarySystemGroupedBackground
        }
    }

    // MARK: - UI

    override func setupStyle() {
        appIconImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }

        titleLabel.do {
            $0.textColor = .label
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 15, weight: .regular)
            $0.numberOfLines = 2
        }

        subtitleLabel.do {
            $0.textColor = .systemGray
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 12, weight: .regular)
        }

        appInfoView.do {
            $0.addArrangedSubview(titleLabel)
            $0.addArrangedSubview(subtitleLabel)
            $0.axis = .vertical
            $0.alignment = .leading
            $0.distribution = .fillProportionally
            $0.spacing = 2
        }

        installButton.do {
            $0.backgroundColor = .tertiarySystemGroupedBackground
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }

        inAppPurchasesLabel.do {
            $0.text = "앱 내 구입"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 8, weight: .regular)
        }
    }

    override func setupSubviews() {
        contentView.addSubviews(
            appIconImageView,
            appInfoView,
            installButton,
            inAppPurchasesLabel
        )
    }

    override func setupConstraints() {
        appIconImageView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.size.equalTo(60)
        }

        appInfoView.snp.makeConstraints {
            $0.centerY.equalTo(appIconImageView)
            $0.left.equalTo(appIconImageView.snp.right).offset(5)
        }

        installButton.snp.makeConstraints {
            $0.centerY.equalTo(appInfoView)
            $0.left.greaterThanOrEqualTo(appInfoView.snp.right).offset(10)
            $0.right.equalToSuperview()
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }

        inAppPurchasesLabel.snp.makeConstraints {
            $0.centerX.left.equalTo(installButton)
            $0.top.equalTo(installButton.snp.bottom).offset(2)
        }
    }
}
