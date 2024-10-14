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
            $0.text = "8.4만개의 평가"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 12, weight: .bold)
        }

        firstRatingLabel.do {
            $0.text = "4.0"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }

        firstRatingStarLabel.do {
            $0.text = "★★★★☆"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 17, weight: .regular)
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

        firstVerticalDividerView.do {
            $0.backgroundColor = .systemGray2
        }

        prizeTitleLabel.do {
            $0.text = "수상"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
        }

        prizeCategoryLabel.do {
            $0.text = "에디터의\n선택"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 10, weight: .bold)
        }

        prizeSubtitleLabel.do {
            $0.text = "앱"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
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

        secondVerticalDividerView.do {
            $0.backgroundColor = .systemGray2
        }

        ageTitleLabel.do {
            $0.text = "연령"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
        }

        ageInfoLabel.do {
            $0.text = "4+"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }

        yearsOldLabel.do {
            $0.text = "세"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
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
