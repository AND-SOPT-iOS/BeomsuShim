//
//  FinanceViewController.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/27/24.
//

import UIKit

final class FinanceViewController: BaseViewController {

    // MARK: - Properties

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
    )
    
    private var dataSource: UICollectionViewDiffableDataSource<FinanceSectionKind, Item>!
    private let items: [Item] = Item.items

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegates()
        setDataSource()
        applySnapshot()
        registerCells()
        setupNavigationBarStyle()
    }

    // MARK: - Helpers

    private func setDelegates() {
        collectionView.delegate = self
    }

    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<FinanceSectionKind, Item>(
            collectionView: collectionView
        ) { collectionView, indexPath, item in
            switch item.sectionType {
            case .featured:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: FeaturedCell.identifier,
                    for: indexPath
                ) as? FeaturedCell else {
                    return UICollectionViewCell()
                }

                cell.configure(item)

                return cell
            case .essential:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: EssentialCell.identifier,
                    for: indexPath
                ) as? EssentialCell else {
                    return UICollectionViewCell()
                }

                cell.configure(item)

                return cell
            case .paidRanking:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: PaidRankingCell.identifier,
                    for: indexPath
                ) as? PaidRankingCell else {
                    return UICollectionViewCell()
                }

                cell.configure(item)

                return cell
            case .freeRanking:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: FreeRankingCell.identifier,
                    for: indexPath
                ) as? FreeRankingCell else {
                    return UICollectionViewCell()
                }

                cell.configure(item)

                return cell
            }
        }

        dataSource.supplementaryViewProvider = { (
            collectionView: UICollectionView, kind: String, indexPath: IndexPath
        ) -> UICollectionReusableView? in
            guard kind == UICollectionView.elementKindSectionHeader else {
                return UICollectionReusableView()
            }

            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            guard section != .featured else { return nil }

            let sectionHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: FinanceSectionHeaderView.identifier,
                for: indexPath
            ) as? FinanceSectionHeaderView

            let headerData: FinanceSectionHeaderItem

            switch section {
            case .essential:
                headerData = FinanceSectionHeaderItem.essentialHeader
            case .paidRanking:
                headerData = FinanceSectionHeaderItem.paidRankingHeader
            case .freeRanking:
                headerData = FinanceSectionHeaderItem.freeRankingHeader
            default:
                return nil
            }

            sectionHeader?.configure(headerData)

            return sectionHeader
        }
    }

    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<FinanceSectionKind, Item>()

        snapshot.appendSections([.featured, .essential, .paidRanking, .freeRanking])
        snapshot.appendItems(Item.items(for: .featured), toSection: .featured)
        snapshot.appendItems(Item.items(for: .essential), toSection: .essential)
        snapshot.appendItems(Item.items(for: .paidRanking), toSection: .paidRanking)
        snapshot.appendItems(Item.items(for: .freeRanking), toSection: .freeRanking)

        dataSource.apply(snapshot)
    }

    private func registerCells() {
        collectionView.do {
            $0.register(
                FeaturedCell.self,
                forCellWithReuseIdentifier: FeaturedCell.identifier
            )

            $0.register(
                FinanceSectionHeaderView.self,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: FinanceSectionHeaderView.identifier
            )

            $0.register(
                EssentialCell.self,
                forCellWithReuseIdentifier: EssentialCell.identifier
            )

            $0.register(
                PaidRankingCell.self,
                forCellWithReuseIdentifier: PaidRankingCell.identifier
            )

            $0.register(
                FreeRankingCell.self,
                forCellWithReuseIdentifier: FreeRankingCell.identifier
            )
        }
    }

    // MARK: - UI

    override func setupNavigationBarStyle() {
        title = "금융"
    }

    override func setupSubviews() {
        view.addSubview(collectionView)
    }

    override func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
            switch section {
            case 0: return self.featuredLayout()
            case 1: return self.itemsLayout()
            case 2: return self.itemsLayout()
            case 3: return self.itemsLayout()
            default: return self.itemsLayout()
            }
        }
    }

    private func featuredLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(300)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .estimated(300)
        )

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

    private func itemsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.2)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.91),
            heightDimension: .estimated(300)
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: Array(repeating: item, count: 3)
        )

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 10, leading: 0, bottom: 0, trailing: 0)

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(100)
        )

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )

        section.boundarySupplementaryItems = [header]

        return section
    }
}

// MARK: - UICollectionViewDelegate

extension FinanceViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }

        let controller = AppDetailViewController()
        controller.title = item.title
        navigationController?.pushViewController(controller, animated: true)
    }
}
