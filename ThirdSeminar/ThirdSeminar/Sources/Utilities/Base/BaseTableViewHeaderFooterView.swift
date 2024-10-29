//
//  BaseTableViewHeaderFooterView.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/28/24.
//

import UIKit

import SnapKit
import Then

class BaseTableViewHeaderFooterView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

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
