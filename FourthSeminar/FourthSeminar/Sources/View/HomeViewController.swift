//
//  HomeViewController.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - Properties

    private let token: String
    private let username: String
    private let hobbyLabel = UILabel()
    private let userIdTextField = UITextField()
    private let fetchButton = UIButton(type: .system)

    // MARK: - Initializer

    init(token: String, username: String) {
        self.token = token
        self.username = username
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("HobbyUpdated"), object: nil)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchUser()
        setupNavigationBar()
        setupNotification()
        configureNavigationBar()
    }

    // MARK: - Actions

    @objc private func searchButtonTapped() {
        let searchVC = SearchViewController(token: token)
        navigationController?.pushViewController(searchVC, animated: true)
    }

    @objc private func handleHobbyUpdateNotification(_ notification: Notification) {
        if let hobby = notification.userInfo?["hobby"] as? String {
            hobbyLabel.text = "\(username)님의 취미는 \(hobby)입니다!"
        }
    }

    // MARK: - API

    private func fetchUser() {
        UserService.fetchUserHobby(token: token) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let hobby):
                hobbyLabel.text = "\(username)님의 취미는 \(hobby)입니다!"
            case .failure:
                hobbyLabel.text = "취미 정보를 불러올 수 없습니다."
            }
        }
    }

    // MARK: - Helpers

    private func setupNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleHobbyUpdateNotification(_:)),
            name: Notification.Name("HobbyUpdated"),
            object: nil
        )
    }

    // MARK: - UI

    private func configureNavigationBar() {
        navigationItem.title = "환영합니다, \(username)님!"

        let searchButton = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .plain,
            target: self,
            action: #selector(searchButtonTapped)
        )
        searchButton.tintColor = .label

        navigationItem.rightBarButtonItem = searchButton
    }

    override func setupStyle() {
        navigationItem.title = "환영합니다, \(username)님!"

        hobbyLabel.do {
            $0.font = .systemFont(ofSize: 24, weight: .bold)
            $0.textAlignment = .center
            $0.numberOfLines = 0
        }
    }

    override func setupSubviews() {
        view.addSubviews(hobbyLabel)
    }

    override func setupConstraints() {
        hobbyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}

// MARK: - Protocols

extension HomeViewController: NavigationConfigurable, AlertDisplayable {}
