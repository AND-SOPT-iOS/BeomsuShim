//
//  PopularChartViewController.swift
//  ThirdSeminar
//
//  Created by RAFA on 11/1/24.
//

import UIKit

final class PopularChartViewController: BaseViewController {

    // MARK: - Properties

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
    )

    private var dataSource: UICollectionViewDiffableDataSource<Int, Item>!
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
        dataSource = UICollectionViewDiffableDataSource<Int, Item>(
            collectionView: collectionView
        ) { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PopularChartCell.identifier,
                for: indexPath
            ) as? PopularChartCell else {
                return UICollectionViewCell()
            }

            cell.configure(item)

            return cell
        }
    }

    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Item>()
        snapshot.appendSections([0])
        snapshot.appendItems(items, toSection: 0)

        dataSource.apply(snapshot)
    }

    private func registerCells() {
        collectionView.do {
            $0.register(
                PopularChartCell.self,
                forCellWithReuseIdentifier: PopularChartCell.identifier
            )
        }
    }

    // MARK: - UI

    override func setupNavigationBarStyle() {
        title = "인기 차트"
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
        return UICollectionViewCompositionalLayout { (
            sectionIndex, environment
        ) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(80)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(80)
            )
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10
            section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)

            return section
        }
    }
}

// MARK: - UICollectionViewDelegate

extension PopularChartViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }

        if item.sectionType == .freeRanking && indexPath.item == 0 {
            let controller = AppDetailViewController()
            controller.title = item.title
            navigationController?.pushViewController(controller, animated: true)
        } else {
            print("DEBUG: Section >>> \(indexPath.section) / Item >>> \(indexPath.item)")
        }
    }
}
