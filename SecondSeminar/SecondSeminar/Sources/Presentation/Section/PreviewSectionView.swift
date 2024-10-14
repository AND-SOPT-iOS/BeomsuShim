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
        previewTitleLabel.do {
            $0.text = "미리 보기"
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }

        previewImageView.do {
            $0.image = UIImage(named: "tossImageView")
            $0.contentMode = .scaleAspectFit
            $0.backgroundColor = #colorLiteral(red: 0.9560224414, green: 0.9657036662, blue: 0.9719848037, alpha: 1)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
            $0.layer.borderWidth = 1
            $0.layer.borderColor = #colorLiteral(red: 0.8891773224, green: 0.8989797235, blue: 0.9022945762, alpha: 1)
        }

        supportDeviceImageView.do {
            $0.image = UIImage(systemName: "iphone.gen3")
            $0.tintColor = .systemGray
        }

        supportDeviceLabel.do {
            $0.text = "iPhone"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 12, weight: .bold)
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
