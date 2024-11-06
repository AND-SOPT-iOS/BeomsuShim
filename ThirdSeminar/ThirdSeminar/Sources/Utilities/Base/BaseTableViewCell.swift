//
//  BaseTableViewCell.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/27/24.
//

import UIKit

import SnapKit
import Then

class BaseTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

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
