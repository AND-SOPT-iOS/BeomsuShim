//
//  AppReviewCell.swift
//  ThirdSeminar
//
//  Created by RAFA on 11/1/24.
//

import UIKit

final class AppReviewCell: BaseCollectionViewCell {

    // MARK: - Properties

    private let reviewContentView = UIView()
    private let reviewTitleLabel = UILabel()
    private let reviewRatingStarLabel = UILabel()
    private let reviewedDateLabel = UILabel()
    private let reviewerNameLabel = UILabel()
    private let reviewInfoStackView = UIStackView()
    private let reviewContentLabel = UILabel()

    // MARK: - Helpers

    func configure(_ item: Review) {
        reviewTitleLabel.text = item.title
        reviewedDateLabel.text = item.date
        reviewerNameLabel.text = "• " + item.nickname
        reviewContentLabel.text = item.content
    }

    // MARK: - UI

    override func setupStyle() {
        reviewContentView.do {
            $0.backgroundColor = .tertiarySystemBackground
            $0.clipsToBounds = false
            $0.layer.cornerRadius = 20
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.2
            $0.layer.shadowOffset = CGSize(width: 0, height: 2)
            $0.layer.shadowRadius = 5
        }

        reviewTitleLabel.do {
            $0.configureLabel("앤솝 iOS YB 35기", size: 15, weight: .medium, numberOfLines: 0)
        }

        reviewRatingStarLabel.do {
            $0.configureLabel(
                "★ ★ ★ ★ ★",
                alignment: .left,
                size: 15,
                weight: .medium
            )
        }

        reviewedDateLabel.do {
            $0.configureLabel(
                "10월 13일",
                color: .systemGray,
                size: 15,
                weight: .medium
            )
        }

        reviewerNameLabel.do {
            $0.configureLabel(
                "• INTJ",
                color: .systemGray,
                size: 15,
                weight: .medium,
                numberOfLines: 1
            )
        }

        reviewInfoStackView.do {
            $0.configureStackView(
                addArrangedSubviews: reviewRatingStarLabel, reviewedDateLabel, reviewerNameLabel,
                axis: .horizontal,
                distribution: .fill
            )
        }

        reviewContentLabel.do {
            $0.configureLabel(
                "동해물과 백두산",
                color: .systemGray,
                size: 15,
                weight: .medium,
                numberOfLines: 2
            )
        }
    }

    override func setupSubviews() {
        contentView.addSubview(reviewContentView)

        reviewContentView.addSubviews(
            reviewTitleLabel,
            reviewInfoStackView,
            reviewContentLabel
        )
    }

    override func setupConstraints() {
        reviewContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        reviewTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.left.equalTo(20)
        }

        reviewInfoStackView.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(10)
            $0.left.equalTo(reviewTitleLabel)
        }

        reviewContentLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(reviewInfoStackView.snp.bottom).offset(5)
            $0.left.equalTo(reviewInfoStackView)
            $0.bottom.lessThanOrEqualTo(-20)
        }
    }
}
