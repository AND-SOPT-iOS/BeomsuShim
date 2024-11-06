//
//  BaseCollectionViewCell.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/27/24.
//

import UIKit

import SnapKit
import Then

class BaseCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupStyle()
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupStyle() { contentView.backgroundColor = .systemBackground }

    func setupSubviews() { }

    func setupConstraints() { }
}
