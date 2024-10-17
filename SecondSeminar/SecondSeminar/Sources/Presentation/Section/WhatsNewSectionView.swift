//
//  WhatsNewSectionView.swift
//  SecondSeminar
//
//  Created by RAFA on 10/14/24.
//

import UIKit

final class WhatsNewSectionView: BaseView {

    // MARK: - Properties

    let whatsNewButton = UIButton(type: .system)
    private let versionLabel = UILabel()
    private let updatedTimeLabel = UILabel()
    let updatedDescriptionLabel = UILabel()
    let seeMoreButton = UIButton(type: .system)

    // MARK: - UI

    override func setStyle() {
        whatsNewButton.do {
            $0.configureButton(
                title: "새로운 소식",
                fontSize: 20,
                fontWeight: .bold,
                imageName: "chevron.right",
                tintColor: .systemGray,
                pointSize: 12,
                imageWeight: .heavy,
                imagePlacement: .trailing
            )
        }

        versionLabel.do {
            $0.configureLabel("버전 5.184.0", color: .systemGray, size: 14, weight: .medium)
        }

        updatedTimeLabel.do {
            $0.configureLabel(
                "2일 전",
                color: .systemGray,
                alignment: .right,
                size: 14,
                weight: .medium
            )
        }

        updatedDescriptionLabel.do {
            $0.applyParagraphStyle(
                text: "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.",
                numberOfLines: 1
            )
        }

        seeMoreButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        }
    }

    override func setUI() {
        addSubviews(
            whatsNewButton,
            versionLabel,
            updatedTimeLabel,
            updatedDescriptionLabel,
            seeMoreButton
        )
    }

    override func setLayout() {
        whatsNewButton.snp.makeConstraints {
            $0.top.left.equalToSuperview()
            $0.height.equalTo(30)
        }

        versionLabel.snp.makeConstraints {
            $0.top.equalTo(whatsNewButton.snp.bottom).offset(10)
            $0.left.equalTo(whatsNewButton)
        }

        updatedTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(versionLabel)
            $0.right.equalToSuperview()
        }

        updatedDescriptionLabel.snp.makeConstraints {
            $0.centerX.left.equalToSuperview()
            $0.top.equalTo(versionLabel.snp.bottom).offset(15)
        }

        seeMoreButton.snp.makeConstraints {
            $0.top.equalTo(updatedDescriptionLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview()
            $0.right.equalTo(updatedDescriptionLabel.snp.right)
        }
    }
}
