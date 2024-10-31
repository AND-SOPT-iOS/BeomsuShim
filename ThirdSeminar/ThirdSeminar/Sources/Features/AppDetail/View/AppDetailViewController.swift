//
//  DetailViewController.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/31/24.
//

import UIKit

final class AppDetailViewController: BaseViewController {

    // MARK: - Properties

    private let tableView = UITableView(frame: .zero, style: .plain)
    private var dataSource: UITableViewDiffableDataSource<AppDetailSectionKind, Int>!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        registerCells()
        setDataSource()
        applySnapshot()
    }

    // MARK: - Helpers

    private func configureTableView() {
        tableView.delegate = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
    }

    private func registerCells() {
        tableView.register(
            AppDetailHeaderCell.self,
            forCellReuseIdentifier: AppDetailHeaderCell.identifier
        )

        tableView.register(
            WhatsNewCell.self,
            forCellReuseIdentifier: WhatsNewCell.identifier
        )

        tableView.register(
            DeveloperInfoCell.self,
            forCellReuseIdentifier: DeveloperInfoCell.identifier
        )

        tableView.register(
            AppFeedbackCell.self,
            forCellReuseIdentifier: AppFeedbackCell.identifier
        )
    }

    private func setDataSource() {
        dataSource = UITableViewDiffableDataSource<AppDetailSectionKind, Int>(
            tableView: tableView
        ) { tableView, indexPath, _ in
            guard let section = AppDetailSectionKind(rawValue: indexPath.section) else {
                return UITableViewCell()
            }

            switch section {
            case .header:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: AppDetailHeaderCell.identifier,
                    for: indexPath
                ) as? AppDetailHeaderCell else {
                    return UITableViewCell()
                }

                cell.selectionStyle = .none

                return cell
            case .whatsNew:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: WhatsNewCell.identifier,
                    for: indexPath
                ) as? WhatsNewCell else {
                    return UITableViewCell()
                }

                cell.selectionStyle = .none

                return cell
            case .developerInfo:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: DeveloperInfoCell.identifier,
                    for: indexPath
                ) as? DeveloperInfoCell else {
                    return UITableViewCell()
                }

                cell.selectionStyle = .none

                return cell
            case .feedback:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: AppFeedbackCell.identifier,
                    for: indexPath
                ) as? AppFeedbackCell else {
                    return UITableViewCell()
                }

                cell.selectionStyle = .none

                return cell
            }
        }
    }

    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<AppDetailSectionKind, Int>()
        snapshot.appendSections(AppDetailSectionKind.allCases)
        snapshot.appendItems([0], toSection: .header)
        snapshot.appendItems([1], toSection: .whatsNew)
        snapshot.appendItems([2], toSection: .developerInfo)
        snapshot.appendItems([3], toSection: .feedback)

        dataSource.apply(snapshot, animatingDifferences: true)
    }

    // MARK: - UI

    override func setupSubviews() {
        view.addSubview(tableView)
    }

    override func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate

extension AppDetailViewController: UITableViewDelegate {

}
