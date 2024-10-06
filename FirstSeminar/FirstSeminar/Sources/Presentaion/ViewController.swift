//
//  ViewController.swift
//  FirstSeminar
//
//  Created by RAFA on 10/6/24.
//

import UIKit

final class ViewController: BaseViewController {

    // MARK: - Properties

    private let fadeTextAnimation = CATransition()
    private let switchModeButton = UISwitch()
    private let titleTextField = UITextField()
    private let contentTextView = UITextView()
    private let placeholderText = "내용을 입력해주세요."
    private let nextButton = UIButton(type: .system)
    private let stackView = UIStackView()

    private var switchPushMode: Bool = false

    // MARK: - Actions

    @objc private func switchModeButtonTapped() {
        switchPushMode.toggle()
        applyFadeAnimationToNavigationBar()
        updateNavigationTitle()
    }

    // MARK: - Helpers

    private func updateNavigationTitle() {
        navigationItem.title = switchPushMode ? "모달" : "내비게이션"
    }

    private func applyFadeAnimationToNavigationBar() {
        fadeTextAnimation.duration = 0.3
        fadeTextAnimation.type = .fade
        navigationController?.navigationBar.layer.add(fadeTextAnimation, forKey: "fadeText")
    }

    // MARK: - UI

    override func setStyle() {
        navigationController?.navigationBar.topItem?.title = "내비게이션"

        switchModeButton.do {
            $0.addTarget(self, action: #selector(switchModeButtonTapped), for: .valueChanged)
        }
    }

    override func setUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: switchModeButton)
    }
}
