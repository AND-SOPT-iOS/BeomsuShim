//
//  DeveloperInfoSectionView.swift
//  SecondSeminar
//
//  Created by RAFA on 10/14/24.
//

import UIKit

final class DeveloperInfoSectionView: BaseView {

    // MARK: - Properties

    private let descriptionLabel = UILabel()
    let developerNameButton = DeveloperNameButton()

    // MARK: - UI

    override func setStyle() {
        descriptionLabel.do {
            $0.applyParagraphStyle(text: "토스뱅크, 토스증권은 SOPT 같은 인재들을 찾습니다.")
        }
    }

    override func setUI() {
        addSubviews(descriptionLabel, developerNameButton)
    }

    override func setLayout() {
        descriptionLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }

        developerNameButton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.left.bottom.right.equalToSuperview()
            $0.height.equalTo(30)
        }
    }
}
