//
//  EditNicknameViewController.swift
//  SecondSeminar
//
//  Created by RAFA on 10/14/24.
//

import UIKit

final class EditNicknameViewController: BaseViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBarStyle()
    }

    // MARK: - Actions

    @objc private func updateButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - UI

    private func setNavigationBarStyle() {
        let updateButton = UIButton(type: .system).then {
            $0.setTitle("업데이트", for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            $0.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        }

        let updateBarButtonItem = UIBarButtonItem(customView: updateButton)

        navigationItem.rightBarButtonItem = updateBarButtonItem
    }
}
