//
//  AppFeedbackCell.swift
//  ThirdSeminar
//
//  Created by RAFA on 11/1/24.
//

import UIKit

final class AppFeedbackCell: BaseTableViewCell {

    // MARK: - Properties

    private let ratingAndReviewButton = UIButton(type: .system)
    private let secondRatingLabel = UILabel()
    private let secondRatingStarLabel = UILabel()
    private let secondReviewCountLabel = UILabel()

    private let mostHelpfulTitleLabel = UILabel()
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
    )

    private let tapToRateTitleLabel = UILabel()
    private var tapToRateButton = [UIButton(type: .system)]
    private let starsStackView = UIStackView()
    private let emptyStarImage = UIImage(systemName: "star")
    private let filledStarImage = UIImage(systemName: "star.fill")
    private let starCount = 5
    private var currentRating = 0

    private let writeReviewButton = UIButton(type: .system)
    private let appSupportButton = UIButton(type: .system)
    private let writeReviewAndAppSupportStackView = UIStackView()

    private var dataSource: UICollectionViewDiffableDataSource<Int, Review>!

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        registerCells()
        setDataSource()
        applySnapshot()
        configureRatingStarButtons()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers

    private func registerCells() {
        collectionView.register(
            AppReviewCell.self,
            forCellWithReuseIdentifier: AppReviewCell.identifier
        )
    }

    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, Review>(
            collectionView: collectionView
        ) { collectionView, indexPath, review in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppReviewCell.identifier,
                for: indexPath
            ) as? AppReviewCell else {
                return UICollectionViewCell()
            }

            cell.configure(review)

            return cell
        }
    }

    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Review>()
        snapshot.appendSections([0])
        snapshot.appendItems(Review.items, toSection: 0)

        dataSource.apply(snapshot, animatingDifferences: true)
    }

    // MARK: - UI

    override func setupStyle() {
        ratingAndReviewButton.do {
            $0.configureButton(
                title: "평가 및 리뷰",
                fontSize: 20,
                fontWeight: .bold,
                imageName: "chevron.right",
                tintColor: .systemGray,
                pointSize: 12,
                imageWeight: .heavy,
                imagePlacement: .trailing
            )
        }

        secondRatingLabel.do { $0.configureLabel("4.0", size: 70, weight: .heavy) }

        secondRatingStarLabel.do {
            $0.configureLabel("★ ★ ★ ★ ☆", alignment: .right, size: 20, weight: .bold)
        }

        secondReviewCountLabel.do {
            $0.configureLabel(
                "8.4만개의 평가",
                color: .systemGray,
                alignment: .right,
                size: 15,
                weight: .bold
            )
        }

        mostHelpfulTitleLabel.do {
            $0.configureLabel("가장 도움이 되는 리뷰", size: 15, weight: .semibold)
        }

        tapToRateTitleLabel.do {
            $0.configureLabel(
                "탭하여 평가하기",
                alignment: .center,
                size: 15,
                weight: .semibold
            )
        }

        starsStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .fill
            $0.spacing = 10
        }

        writeReviewButton.do {
            $0.configureButton(
                title: "리뷰 작성",
                fontSize: 15,
                fontWeight: .medium,
                foregroundColor: .systemBlue,
                imageName: "square.and.pencil",
                pointSize: 10,
                imageWeight: .medium
            )

            $0.backgroundColor = .tertiarySystemGroupedBackground
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }

        appSupportButton.do {
            $0.configureButton(
                title: "앱 지원",
                fontSize: 15,
                fontWeight: .medium,
                foregroundColor: .systemBlue,
                imageName: "questionmark.circle",
                pointSize: 10,
                imageWeight: .medium
            )

            $0.backgroundColor = .tertiarySystemGroupedBackground
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }

        writeReviewAndAppSupportStackView.do {
            $0.configureStackView(
                addArrangedSubviews: writeReviewButton, appSupportButton,
                axis: .horizontal,
                spacing: 10
            )
        }
    }

    override func setupSubviews() {
        contentView.addSubviews(
            ratingAndReviewButton,
            secondRatingLabel,
            secondRatingStarLabel,
            secondReviewCountLabel,
            mostHelpfulTitleLabel,
            collectionView,
            tapToRateTitleLabel,
            starsStackView,
            writeReviewAndAppSupportStackView
        )
    }

    override func setupConstraints() {
        ratingAndReviewButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalTo(20)
            $0.height.equalTo(30)
        }

        secondRatingLabel.snp.makeConstraints {
            $0.top.equalTo(ratingAndReviewButton.snp.bottom).offset(5)
            $0.left.equalTo(ratingAndReviewButton)
        }

        secondRatingStarLabel.snp.makeConstraints {
            $0.right.equalTo(-20)
        }

        secondReviewCountLabel.snp.makeConstraints {
            $0.top.equalTo(secondRatingStarLabel.snp.bottom).offset(5)
            $0.bottom.equalTo(secondRatingLabel.snp.firstBaseline)
            $0.right.equalTo(secondRatingStarLabel)
        }

        mostHelpfulTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(secondRatingLabel.snp.bottom).offset(10)
            $0.left.equalTo(secondRatingLabel)
        }

        collectionView.snp.makeConstraints {
            $0.centerX.left.equalToSuperview()
            $0.top.equalTo(mostHelpfulTitleLabel.snp.bottom).offset(20)
            $0.height.greaterThanOrEqualTo(150)
        }

        tapToRateTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(collectionView.snp.bottom).offset(20)
            $0.left.equalTo(collectionView)
        }

        starsStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tapToRateTitleLabel.snp.bottom).offset(5)
            $0.height.equalTo(40)
        }

        writeReviewAndAppSupportStackView.snp.makeConstraints {
            $0.centerX.bottom.equalToSuperview()
            $0.top.equalTo(starsStackView.snp.bottom).offset(10)
            $0.left.equalTo(mostHelpfulTitleLabel)
            $0.height.equalTo(50)
        }
    }

    private func configureRatingStarButtons() {
        for i in 0..<starCount {
            let button = UIButton(type: .system)
            button.do {
                $0.tag = i + 1
                $0.setImage(emptyStarImage?
                    .withConfiguration(UIImage.SymbolConfiguration(weight: .semibold)), for: .normal)
                tapToRateButton.append(button)
                starsStackView.addArrangedSubview(button)
            }
        }
    }

    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.41)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .estimated(200)
        )

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return UICollectionViewCompositionalLayout(section: section)
    }
}
