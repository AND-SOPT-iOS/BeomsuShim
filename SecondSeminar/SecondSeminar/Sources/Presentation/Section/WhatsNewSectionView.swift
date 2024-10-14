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
    private let updatedDescriptionLabel = UILabel()

    // MARK: - UI

    override func setStyle() {
        whatsNewButton.do {
            var config = UIButton.Configuration.plain()
            config.image = UIImage(systemName: "chevron.right")?
                .withTintColor(.systemGray, renderingMode: .alwaysOriginal)
                .withConfiguration(UIImage.SymbolConfiguration(pointSize: 12, weight: .heavy))
            config.contentInsets = .zero
            config.baseForegroundColor = .label
            config.imagePlacement = .trailing
            config.imagePadding = 5
            config.attributedTitle = AttributedString(
                NSAttributedString(
                    string: "새로운 소식",
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 20, weight: .bold)
                    ]
                )
            )
            $0.configuration = config
        }

        versionLabel.do {
            $0.text = "버전 5.184.0"
            $0.textColor = .systemGray
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 14, weight: .medium)
        }

        updatedTimeLabel.do {
            $0.text = "2일 전"
            $0.textColor = .systemGray
            $0.textAlignment = .right
            $0.font = .systemFont(ofSize: 14, weight: .medium)
        }

        updatedDescriptionLabel.do {
            let text = """
            • 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.
            """
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4

            let attributedString = NSAttributedString(
                string: text,
                attributes: [
                    .paragraphStyle: paragraphStyle,
                    .font: UIFont.systemFont(ofSize: 14, weight: .regular)
                ]
            )

            $0.attributedText = attributedString
            $0.textAlignment = .left
            $0.numberOfLines = 0
        }
    }

    override func setUI() {
        addSubviews(
            whatsNewButton,
            versionLabel,
            updatedTimeLabel,
            updatedDescriptionLabel
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
            $0.centerX.left.bottom.equalToSuperview()
            $0.top.equalTo(versionLabel.snp.bottom).offset(15)
        }
    }
}
