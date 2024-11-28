//
//  NavigationConfigurable+UIViewController.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

protocol NavigationConfigurable: AnyObject {
    func setupNavigationBar()
    func setupBackButton()
}

extension NavigationConfigurable where Self: UIViewController {

    func setupNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }

        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 14)]
        appearance.backgroundColor = .systemBackground
        appearance.shadowColor = nil

        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }

    func setupBackButton() {
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(back)
        )
        backButton.tintColor = .label
        navigationItem.leftBarButtonItem = backButton
    }
}
