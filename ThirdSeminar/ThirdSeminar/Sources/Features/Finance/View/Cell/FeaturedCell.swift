//
//  FeaturedCell.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/29/24.
//

import UIKit

import SnapKit

final class FeaturedCell: BaseCollectionViewCell {

    // MARK: - Properties

    private let categoryLabel = UILabel()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let headerView = UIStackView()

    private let appContainerView = UIView()
    private let appIconImageView = UIImageView()
    private let appNameLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let appInfoView = UIStackView()
    private let installButton = UIButton(type: .system)
    private let inAppPurchasesLabel = UILabel()

    private var appIconBottomConstraint: Constraint?

    // MARK: - Helpers

    func configure(_ item: Item) {
        categoryLabel.text = item.category?.categoryTitle
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        appContainerView.backgroundColor = item.backgroundColor
        appIconImageView.image = UIImage(named: item.appIcon)
        appNameLabel.text = item.title
        subtitleLabel.text = item.subtitle
        updateInstallButtonTitle(for: item)
        updateInAppPurchasesVisibility(isVisible: item.hasInAppPurchases)
    }

    private func updateInstallButtonTitle(for item: Item) {
        if item.downloadState == .paid {
            guard let price = item.price else { return }

            installButton.setAttributedTitle(
                NSAttributedString(
                    string: "₩\(price)",
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 13, weight: .bold),
                        .foregroundColor: UIColor.white
                    ]
                ),
                for: .normal
            )
        } else {
            installButton.setAttributedTitle(
                NSAttributedString(
                    string: item.downloadState.buttonTitle,
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 13, weight: .bold),
                        .foregroundColor: UIColor.white
                    ]
                ),
                for: .normal
            )
        }
    }

    private func updateInAppPurchasesVisibility(isVisible: Bool) {
        guard inAppPurchasesLabel.superview == nil else { return }

        if isVisible {
            appContainerView.addSubview(inAppPurchasesLabel)
            appIconBottomConstraint?.deactivate()
            inAppPurchasesLabel.snp.makeConstraints {
                $0.centerX.equalTo(installButton)
                $0.left.equalTo(installButton)
                $0.top.equalTo(installButton.snp.bottom).offset(5)
                $0.bottom.equalTo(appContainerView.snp.bottom).inset(5)
            }
        } else {
            inAppPurchasesLabel.removeFromSuperview()
            appIconBottomConstraint?.deactivate()
            appIconImageView.snp.makeConstraints {
                appIconBottomConstraint = $0.bottom.equalTo(
                    appContainerView.snp.bottom
                ).offset(-10).constraint
            }
        }
    }

    // MARK: - UI

    override func setupStyle() {
        categoryLabel.do {
            $0.textColor = .systemBlue
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 12, weight: .bold)
        }

        titleLabel.do {
            $0.textColor = .label
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 20, weight: .regular)
        }

        descriptionLabel.do {
            $0.textColor = .systemGray
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 17, weight: .regular)
        }

        headerView.do {
            $0.addArrangedSubview(categoryLabel)
            $0.addArrangedSubview(titleLabel)
            $0.addArrangedSubview(descriptionLabel)
            $0.axis = .vertical
            $0.alignment = .leading
            $0.distribution = .fillProportionally
            $0.spacing = 2
        }

        appContainerView.do {
            $0.backgroundColor = .systemIndigo
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 8
        }

        appIconImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }

        appNameLabel.do {
            $0.textColor = .label
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 12, weight: .regular)
        }

        subtitleLabel.do {
            $0.textColor = .white.withAlphaComponent(0.7)
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 12, weight: .regular)
        }

        appInfoView.do {
            $0.addArrangedSubview(appNameLabel)
            $0.addArrangedSubview(subtitleLabel)
            $0.axis = .vertical
            $0.alignment = .leading
            $0.distribution = .fillProportionally
            $0.spacing = 2
        }

        installButton.do {
            $0.backgroundColor = .white.withAlphaComponent(0.4)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }

        inAppPurchasesLabel.do {
            $0.text = "앱 내 구입"
            $0.textColor = .white.withAlphaComponent(0.7)
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 8, weight: .regular)
        }
    }

    override func setupSubviews() {
        contentView.addSubviews(
            headerView,
            appContainerView,
            appIconImageView,
            appInfoView,
            installButton
        )
    }

    override func setupConstraints() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }

        appContainerView.snp.makeConstraints {
            $0.centerX.left.equalTo(headerView)
            $0.top.equalTo(headerView.snp.bottom).offset(10)
            $0.bottom.equalToSuperview()
        }

        appIconImageView.snp.makeConstraints {
            $0.left.equalTo(appContainerView).inset(10)
            $0.size.equalTo(40)
        }

        appInfoView.snp.makeConstraints {
            $0.centerY.equalTo(appIconImageView)
            $0.left.equalTo(appIconImageView.snp.right).offset(5)
        }

        installButton.snp.makeConstraints {
            $0.centerY.equalTo(appInfoView)
            $0.left.greaterThanOrEqualTo(appInfoView.snp.right).offset(10)
            $0.right.equalToSuperview().inset(10)
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }
    }
}
