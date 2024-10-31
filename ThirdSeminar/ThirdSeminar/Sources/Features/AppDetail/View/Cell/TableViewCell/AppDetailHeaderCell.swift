//
//  AppDetailHeaderCell.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/31/24.
//

import UIKit

final class AppDetailHeaderCell: BaseTableViewCell {

    // MARK: - Properties

    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let infoStackView = UIStackView()
    private let installButton = UIButton(type: .system)
    private let shareButton = UIButton(type: .system)

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
    )

    private var dataSource: UICollectionViewDiffableDataSource<Int, Int>!

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        registerCells()
        setDataSource()
        applySnapshot()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers

    private func registerCells() {
        collectionView.do {
            $0.register(
                AppMetaInfoCell.self,
                forCellWithReuseIdentifier: AppMetaInfoCell.identifier
            )
        }
    }

    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppMetaInfoCell.identifier, for: indexPath
            ) as? AppMetaInfoCell else {
                return UICollectionViewCell()
            }

            return cell
        }
    }

    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapshot.appendSections([0])
        snapshot.appendItems([1, 2], toSection: 0)
        dataSource.apply(snapshot)
    }

    // MARK: - UI

    override func setupStyle() {
        iconImageView.do {
            $0.image = ._0
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor.systemGray4.cgColor
        }

        titleLabel.do { $0.configureLabel("토스", size: 20, weight: .semibold) }

        subtitleLabel.do {
            $0.configureLabel("금융이 쉬워진다", color: .systemGray, size: 14, weight: .semibold)
        }

        infoStackView.do {
            $0.configureStackView(
                addArrangedSubviews: titleLabel, subtitleLabel,
                alignment: .leading,
                spacing: 3
            )
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

    override func setupSubviews() {
        contentView.addSubviews(
            iconImageView,
            infoStackView,
            installButton,
            shareButton,
            collectionView
        )
    }

    override func setupConstraints() {
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalTo(20)
            $0.size.equalTo(120)
        }

        infoStackView.snp.makeConstraints {
            $0.top.equalTo(iconImageView)
            $0.left.equalTo(iconImageView.snp.right).offset(15)
            $0.right.equalTo(-20)
        }

        installButton.snp.makeConstraints {
            $0.left.equalTo(infoStackView)
            $0.bottom.equalTo(iconImageView)
            $0.width.equalTo(80)
            $0.height.equalTo(30)
        }

        shareButton.snp.makeConstraints {
            $0.centerY.equalTo(installButton)
            $0.right.equalTo(-20)
            $0.size.equalTo(30)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.greaterThanOrEqualTo(100)
        }
    }

    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.33)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(200)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 20, leading: 0, bottom: 0, trailing: 0)

        return UICollectionViewCompositionalLayout(section: section)
    }
}
