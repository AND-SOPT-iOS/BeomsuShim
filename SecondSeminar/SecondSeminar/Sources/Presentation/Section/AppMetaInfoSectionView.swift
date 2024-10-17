//
//  AppMetaInfoSectionView.swift
//  SecondSeminar
//
//  Created by RAFA on 10/14/24.
//

import UIKit

final class AppMetaInfoSectionView: BaseView {

    // MARK: - Properties

    private let firstReviewCountLabel = UILabel()
    private let firstRatingLabel = UILabel()
    private let firstRatingStarLabel = UILabel()
    private let firstRatingImageView = UIImageView()
    private let ratingInfoStackView = UIStackView()

    private let firstVerticalDividerView = UIView()

    private let prizeTitleLabel = UILabel()
    private let prizeSubtitleLabel = UILabel()
    private let prizeCategoryLabel = UILabel()
    private let prizeInfoStackView = UIStackView()

    private let secondVerticalDividerView = UILabel()

    private let ageTitleLabel = UILabel()
    private let ageInfoLabel = UILabel()
    private let yearsOldLabel = UILabel()
    private let ageInfoStackView = UIStackView()

    // MARK: - UI

    override func setStyle() {
        firstReviewCountLabel.do {
            $0.configureLabel(
                "8.4만개의 평가",
                color: .systemGray,
                alignment: .center,
                size: 12,
                weight: .bold,
                numberOfLines: 1
            )
        }

        firstRatingLabel.do {
            $0.configureLabel(
                "4.0",
                color: .systemGray,
                alignment: .center,
                size: 20,
                weight: .bold,
                numberOfLines: 1
            )
        }

        firstRatingStarLabel.do {
            $0.configureLabel(
                "★★★★☆",
                color: .systemGray,
                alignment: .center,
                size: 17,
                weight: .regular,
                numberOfLines: 1
            )
        }

        ratingInfoStackView.do {
            $0.addArrangedSubview(firstReviewCountLabel)
            $0.addArrangedSubview(firstRatingLabel)
            $0.addArrangedSubview(firstRatingStarLabel)
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .fillProportionally
            $0.spacing = 5
        }

        firstVerticalDividerView.do { $0.configureDivider() }

        prizeTitleLabel.do {
            $0.configureLabel(
                "수상",
                color: .systemGray,
                alignment: .center,
                size: 12,
                weight: .semibold,
                numberOfLines: 1
            )
        }

        prizeCategoryLabel.do {
            $0.configureLabel(
                "에디터의\n선택",
                color: .systemGray,
                alignment: .center,
                size: 10,
                weight: .bold,
                numberOfLines: 2
            )
        }

        prizeSubtitleLabel.do {
            $0.configureLabel(
                "앱",
                color: .systemGray,
                alignment: .center,
                size: 15,
                weight: .semibold,
                numberOfLines: 1
            )
        }

        prizeInfoStackView.do {
            $0.addArrangedSubview(prizeTitleLabel)
            $0.addArrangedSubview(prizeCategoryLabel)
            $0.addArrangedSubview(prizeSubtitleLabel)
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .fillProportionally
            $0.spacing = 5
        }

        secondVerticalDividerView.do { $0.configureDivider() }

        ageTitleLabel.do {
            $0.configureLabel(
                "연령",
                color: .systemGray,
                alignment: .center,
                size: 12,
                weight: .semibold,
                numberOfLines: 1
            )
        }

        ageInfoLabel.do {
            $0.configureLabel(
                "4+",
                color: .systemGray,
                alignment: .center,
                size: 20,
                weight: .bold,
                numberOfLines: 1
            )
        }

        yearsOldLabel.do {
            $0.configureLabel(
                "세",
                color: .systemGray,
                alignment: .center,
                size: 15,
                weight: .semibold,
                numberOfLines: 1
            )
        }

        ageInfoStackView.do {
            $0.addArrangedSubview(ageTitleLabel)
            $0.addArrangedSubview(ageInfoLabel)
            $0.addArrangedSubview(yearsOldLabel)
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .fillProportionally
            $0.spacing = 5
        }
    }

    override func setUI() {
        addSubviews(
            ratingInfoStackView,
            firstVerticalDividerView,
            prizeInfoStackView,
            secondVerticalDividerView,
            ageInfoStackView
        )
    }

    override func setLayout() {
        ratingInfoStackView.snp.makeConstraints {
            $0.top.left.bottom.equalToSuperview()
        }

        firstVerticalDividerView.snp.makeConstraints {
            $0.centerY.equalTo(ratingInfoStackView)
            $0.left.equalTo(ratingInfoStackView.snp.right).offset(20)
            $0.width.equalTo(0.3)
            $0.height.equalTo(40)
        }

        prizeInfoStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(ratingInfoStackView)
            $0.left.equalTo(firstVerticalDividerView.snp.right).offset(20)
        }

        secondVerticalDividerView.snp.makeConstraints {
            $0.centerY.equalTo(firstVerticalDividerView)
            $0.left.equalTo(prizeInfoStackView.snp.right).offset(20)
            $0.width.equalTo(0.3)
            $0.height.equalTo(40)
        }

        ageInfoStackView.snp.makeConstraints {
            $0.top.equalTo(prizeInfoStackView)
            $0.left.equalTo(secondVerticalDividerView.snp.right).offset(20)
            $0.right.equalToSuperview()
        }
    }
}
