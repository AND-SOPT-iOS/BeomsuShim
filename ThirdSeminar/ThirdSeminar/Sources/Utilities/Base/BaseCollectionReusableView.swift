//
//  BaseCollectionReusableView.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/28/24.
//

import UIKit

import SnapKit
import Then

class BaseCollectionReusableView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupStyle()
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupStyle() { backgroundColor = .systemBackground }

    func setupSubviews() { }

    func setupConstraints() { }
}
