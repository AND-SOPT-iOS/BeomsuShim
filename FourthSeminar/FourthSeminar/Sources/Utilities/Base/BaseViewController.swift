//
//  BaseViewController.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import UIKit

import SnapKit
import Then

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupStyle()
        setupSubviews()
        setupConstraints()
    }

    func setupStyle() {}

    func setupSubviews() {}

    func setupConstraints() {}
}
