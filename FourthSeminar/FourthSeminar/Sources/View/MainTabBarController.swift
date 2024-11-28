//
//  MainTabBarController.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

import Then

final class MainTabBarController: UITabBarController {

    // MARK: - Properties

    private let token: String
    private let username: String

    // MARK: - Initializer

    init(token: String, username: String) {
        self.token = token
        self.username = username
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllers()
    }

    // MARK: - Helpers

    private func configureViewControllers() {
        let homeVC = HomeViewController(token: token, username: username)
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        homeNav.navigationBar.prefersLargeTitles = true

        let settingVC = SettingViewController()
        settingVC.tabBarItem = UITabBarItem(
            title: "설정",
            image: UIImage(systemName: "gearshape"),
            selectedImage: UIImage(systemName: "gearshape.fill")
        )

        viewControllers = [homeNav, settingVC]

        setupTabBarAppearance()
    }

    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.shadowImage = UIImage()
        appearance.shadowColor = nil
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = .label
    }
}

extension MainTabBarController: AlertDisplayable {}
