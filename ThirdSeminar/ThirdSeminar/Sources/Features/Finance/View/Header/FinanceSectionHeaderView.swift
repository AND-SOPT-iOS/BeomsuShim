//
//  FinanceSectionHeaderView.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/29/24.
//

import UIKit

final class FinanceSectionHeaderView: BaseCollectionReusableView {

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let rightArrowImageView = UIImageView()

    var onHeaderTapped: (() -> Void)?

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)

        setTapGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions

    @objc private func handleHeaderTapped() {
        onHeaderTapped?()
    }

    // MARK: - Gestures

    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleHeaderTapped))
        addGestureRecognizer(tapGesture)
    }

    // MARK: - Helpers

    func configure(_ item: FinanceSectionHeaderItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        subtitleLabel.isHidden = item.subtitle == nil
        rightArrowImageView.image = UIImage(systemName: item.rightArrowIcon)?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 14, weight: .heavy))
    }

    // MARK: - UI

    override func setupStyle() {
        titleLabel.do {
            $0.textColor = .label
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 17, weight: .heavy)
        }

        rightArrowImageView.do {
            $0.tintColor = .systemGray
        }

        subtitleLabel.do {
            $0.textColor = .systemGray
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 12, weight: .regular)
        }
    }

    override func setupSubviews() {
        addSubviews(titleLabel, rightArrowImageView, subtitleLabel)
    }

    override func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(40)
            $0.left.equalTo(20)
        }

        rightArrowImageView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.left.equalTo(titleLabel.snp.right).offset(5)
        }

        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.left.equalTo(titleLabel)
            $0.bottom.equalToSuperview()
        }
    }
}
