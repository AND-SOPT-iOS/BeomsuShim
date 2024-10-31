//
//  WhatsNewCell.swift
//  ThirdSeminar
//
//  Created by RAFA on 11/1/24.
//

import UIKit

final class WhatsNewCell: BaseTableViewCell {

    // MARK: - Properties

    private let whatsNewButton = UIButton(type: .system)
    private let versionLabel = UILabel()
    private let updatedTimeLabel = UILabel()
    private let updatedDescriptionLabel = UILabel()
    private let seeMoreButton = UIButton(type: .system)
    private let previewTitleLabel = UILabel()

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
    )

    private var isExpanded = false
    private var isTruncated = false
    private var dataSource: UICollectionViewDiffableDataSource<Int, Preview>!

    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setAddTargets()
        checkDescriptionLabelLines()
        registerCells()
        setDataSource()
        applySnapshot()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions

    @objc private func toggleDescription() {
        isExpanded.toggle()
        updatedDescriptionLabel.numberOfLines = isExpanded ? 0 : 1
        seeMoreButton.setTitle(isExpanded ? "접기" : "더보기", for: .normal)

        if let tableView = self.superview as? UITableView {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }

    private func setAddTargets() {
        seeMoreButton.addTarget(self, action: #selector(toggleDescription), for: .touchUpInside)
    }

    // MARK: - Helpers

    private func checkDescriptionLabelLines() {
        guard let text = updatedDescriptionLabel.text,
              let font = updatedDescriptionLabel.font
        else {
            return
        }

        let labelWidth = updatedDescriptionLabel.frame.width
        let labelHeight = updatedDescriptionLabel.frame.height
        let maxSize = CGSize(width: labelWidth, height: .greatestFiniteMagnitude)
        let calculatedTextHeight = text.boundingRect(
            with: maxSize,
            options: .usesLineFragmentOrigin,
            attributes: [.font: font],
            context: nil
        ).height

        if isExpanded {
            seeMoreButton.isHidden = false
        } else {
            let isTextTruncated = calculatedTextHeight > labelHeight
            seeMoreButton.isHidden = !isTextTruncated
            isTruncated = isTextTruncated
        }
    }

    private func registerCells() {
        collectionView.register(
            PreviewCell.self,
            forCellWithReuseIdentifier: PreviewCell.identifier
        )
    }

    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, Preview>(collectionView: collectionView) { collectionView, indexPath, previewItem in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PreviewCell.identifier, for: indexPath
            ) as? PreviewCell else {
                return UICollectionViewCell()
            }

            cell.configure(previewItem)

            return cell
        }
    }

    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Preview>()
        snapshot.appendSections([0])
        snapshot.appendItems(Preview.items, toSection: 0)

        dataSource.apply(snapshot, animatingDifferences: true)
    }

    // MARK: - UI

    override func setupStyle() {
        whatsNewButton.do {
            $0.configureButton(
                title: "새로운 소식",
                fontSize: 20,
                fontWeight: .bold,
                imageName: "chevron.right",
                tintColor: .systemGray,
                pointSize: 12,
                imageWeight: .heavy,
                imagePlacement: .trailing
            )
        }

        versionLabel.do {
            $0.configureLabel("버전 5.184.0", color: .systemGray, size: 14, weight: .medium)
        }

        updatedTimeLabel.do {
            $0.configureLabel(
                "2일 전",
                color: .systemGray,
                alignment: .right,
                size: 14,
                weight: .medium
            )
        }

        updatedDescriptionLabel.do {
            $0.applyParagraphStyle(
                text: "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.",
                numberOfLines: 1
            )
        }

        seeMoreButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        }

        previewTitleLabel.do { $0.configureLabel("미리 보기", size: 20, weight: .bold) }
    }

    override func setupSubviews() {
        contentView.addSubviews(
            whatsNewButton,
            versionLabel,
            updatedTimeLabel,
            updatedDescriptionLabel,
            seeMoreButton,
            previewTitleLabel,
            collectionView
        )
    }

    override func setupConstraints() {
        whatsNewButton.snp.makeConstraints {
            $0.top.left.equalTo(20)
            $0.height.equalTo(30)
        }

        versionLabel.snp.makeConstraints {
            $0.top.equalTo(whatsNewButton.snp.bottom).offset(10)
            $0.left.equalTo(whatsNewButton)
        }

        updatedTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(versionLabel)
            $0.right.equalTo(-20)
        }

        updatedDescriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.equalTo(versionLabel)
            $0.top.equalTo(versionLabel.snp.bottom).offset(15)
        }

        seeMoreButton.snp.makeConstraints {
            $0.top.equalTo(updatedDescriptionLabel.snp.bottom).offset(5)
            $0.right.equalTo(updatedDescriptionLabel)
        }

        previewTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(seeMoreButton.snp.bottom).offset(20)
            $0.left.equalTo(updatedDescriptionLabel)
        }

        collectionView.snp.makeConstraints {
            $0.centerX.left.bottom.equalToSuperview()
            $0.top.equalTo(previewTitleLabel.snp.bottom).offset(20)
            $0.height.greaterThanOrEqualTo(500)
        }
    }

    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.7),
            heightDimension: .fractionalHeight(1.0)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging

        return UICollectionViewCompositionalLayout(section: section)
    }
}
