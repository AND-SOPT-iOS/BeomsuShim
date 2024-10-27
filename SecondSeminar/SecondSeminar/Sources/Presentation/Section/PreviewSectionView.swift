//
//  PreviewSectionView.swift
//  SecondSeminar
//
//  Created by RAFA on 10/14/24.
//

import UIKit

final class PreviewSectionView: BaseView {

    // MARK: - Properties

    private let previewTitleLabel = UILabel()
    private let previewImageView = UIImageView()
    private let supportDeviceImageView = UIImageView()
    private let supportDeviceLabel = UILabel()

    // MARK: - UI

    override func setStyle() {
        previewTitleLabel.do { $0.configureLabel("미리 보기", size: 20, weight: .bold) }

        previewImageView.do {
            $0.image = UIImage(named: "tossImageView")
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

    override func setUI() {
        addSubviews(
            previewTitleLabel,
            previewImageView,
            supportDeviceImageView,
            supportDeviceLabel
        )
    }

    override func setLayout() {
        previewTitleLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }

        previewImageView.snp.makeConstraints {
            $0.top.equalTo(previewTitleLabel.snp.bottom).offset(10)
            $0.left.equalTo(previewTitleLabel)
            $0.width.equalTo(snp.width).multipliedBy(0.6)
            $0.height.equalTo(450)
        }

        supportDeviceImageView.snp.makeConstraints {
            $0.top.equalTo(previewImageView.snp.bottom).offset(10)
            $0.left.equalTo(previewImageView)
            $0.width.equalTo(18)
            $0.height.equalTo(20)
        }

        supportDeviceLabel.snp.makeConstraints {
            $0.centerY.equalTo(supportDeviceImageView)
            $0.left.equalTo(supportDeviceImageView.snp.right).offset(5)
            $0.bottom.equalToSuperview()
            $0.right.equalTo(previewTitleLabel)
        }
    }
}
