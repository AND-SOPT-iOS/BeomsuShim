//
//  SearchViewController.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

final class SearchViewController: BaseViewController {

    // MARK: - Properties

    private let token: String
    private let hobbyLabel = UILabel()
    private let searchBar = UISearchBar()


    // MARK: - Initializer

    init(token: String) {
        self.token = token
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupSearchBar()
        setupBackButton()
    }

    // MARK: - Actions

    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text, !text.isEmpty, let userId = Int(text) else {
            hobbyLabel.text = ""
            return
        }

        fetchUserHobbyById(userId: userId)
    }

    // MARK: - API

    private func fetchUserHobbyById(userId: Int) {
        UserService.fetchUserHobbyById(userId: userId, token: token) { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let hobby):
                    self.hobbyLabel.text = "\(userId)님의 취미는 \(hobby)입니다!"
                case .failure:
                    self.hobbyLabel.text = "취미 정보를 불러올 수 없습니다."
                }
            }
        }
    }

    // MARK: - Helpers

    private func setupSearchBar() {
        searchBar.placeholder = "사용자 번호 입력"
        searchBar.keyboardType = .numberPad
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }

    // MARK: - UI

    override func setupStyle() {
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

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let userId = Int(searchText), !searchText.isEmpty else {
            hobbyLabel.text = ""
            return
        }

        fetchUserHobbyById(userId: userId)
    }
}

// MARK: - Protocols

extension SearchViewController: NavigationConfigurable {}
