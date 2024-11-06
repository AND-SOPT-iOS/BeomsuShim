//
//  BaseViewController.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/27/24.
//

import UIKit

import SnapKit
import Then

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarStyle()
        setupStyle()
        setupSubviews()
        setupConstraints()
    }

    func setupNavigationBarStyle() { }

    func setupStyle() { view.backgroundColor = .systemBackground }

    func setupSubviews() { }

    func setupConstraints() { }
}
