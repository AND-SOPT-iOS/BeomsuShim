//
//  PreviewCell.swift
//  ThirdSeminar
//
//  Created by RAFA on 11/1/24.
//

import UIKit

final class PreviewCell: BaseCollectionViewCell {

    // MARK: - Properties

    private let previewImageView = UIImageView()
    private let supportDeviceImageView = UIImageView()
    private let supportDeviceLabel = UILabel()

    // MARK: - Helpers

    func configure(_ item: Preview) {
        previewImageView.image = UIImage(named: item.image)
    }

    // MARK: - UI

    override func setupStyle() {
        previewImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.backgroundColor = .previewBackgroundColor
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
            $0.layer.borderWidth = 1
            $0.layer.borderColor = .previewBorderColor
        }

        supportDeviceImageView.do {
            $0.image = UIImage(systemName: "iphone.gen3")
            $0.tintColor = .systemGray
        }

        supportDeviceLabel.do {
            $0.configureLabel("iPhone", color: .systemGray, size: 12, weight: .bold)
        }
    }

    override func setupSubviews() {
        contentView.addSubviews(
            previewImageView,
            supportDeviceImageView,
            supportDeviceLabel
        )
    }

    override func setupConstraints() {
        previewImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalTo(20)
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualTo(400)
        }

        supportDeviceImageView.snp.makeConstraints {
            $0.top.equalTo(previewImageView.snp.bottom).offset(10)
            $0.left.equalTo(previewImageView)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(18)
            $0.height.equalTo(20)
        }

        supportDeviceLabel.snp.makeConstraints {
            $0.centerY.equalTo(supportDeviceImageView)
            $0.left.equalTo(supportDeviceImageView.snp.right).offset(5)
            $0.right.equalTo(-20)
        }
    }
}
