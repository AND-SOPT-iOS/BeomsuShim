//
//  AppFeedbackSectionView.swift
//  SecondSeminar
//
//  Created by RAFA on 10/14/24.
//

import UIKit

protocol SubmissionDelegate: AnyObject {

    func displaySubmissionAlert(_ alertView: UIView)
}

final class AppFeedbackSectionView: BaseView {

    // MARK: - Properties

    weak var delegate: SubmissionDelegate?

    let ratingAndReviewButton = UIButton(type: .system)
    private let secondRatingLabel = UILabel()
    private let secondRatingStarLabel = UILabel()
    private let secondReviewCountLabel = UILabel()

    private let mostHelpfulTitleLabel = UILabel()
    private let reviewContentView = UIView()
    let reviewTitleLabel = UILabel()
    let reviewRatingStarLabel = UILabel()
    let reviewedDateLabel = UILabel()
    let reviewerNameLabel = UILabel()
    private let reviewInfoStackView = UIStackView()
    let reviewContentLabel = UILabel()

    private let tapToRateTitleLabel = UILabel()
    private var tapToRateButton = [UIButton(type: .system)]
    private let starsStackView = UIStackView()
    private let emptyStarImage = UIImage(systemName: "star")
    private let filledStarImage = UIImage(systemName: "star.fill")
    let starCount = 5
    private var currentRating = 0

    let writeReviewButton = UIButton(type: .system)
    let appSupportButton = UIButton(type: .system)
    private let writeReviewAndAppSupportStackView = UIStackView()

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)

        setPanGesture()
        configureRatingStarButtons()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions

    @objc private func starTapped(_ sender: UIButton) {
        currentRating = sender.tag + 1
        updateStarImages()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showSubmissionAlert()
        }
    }

    // MARK: - Gestures

    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: starsStackView)

        for (index, button) in tapToRateButton.enumerated() {
            if button.frame.contains(location) {
                currentRating = index + 1
                updateStarImages()
                break
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showSubmissionAlert()
        }
    }

    private func setPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        panGesture.delegate = self
        starsStackView.addGestureRecognizer(panGesture)
    }

    // MARK: - Helpers

    override func layoutSubviews() {
        super.layoutSubviews()

        reviewContentView.layer.shadowPath = UIBezierPath(
            roundedRect: reviewContentView.bounds,
            cornerRadius: 20
        ).cgPath
    }

    private func updateStarImages() {
        for (index, button) in tapToRateButton.enumerated() {
            if index < currentRating {
                button.setImage(filledStarImage, for: .normal)
            } else {
                button.setImage(emptyStarImage, for: .normal)
            }
        }
    }

    // MARK: - UI

    override func setStyle() {
        ratingAndReviewButton.do {
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
                    string: "평가 및 리뷰",
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 20, weight: .bold)
                    ]
                )
            )
            $0.configuration = config
        }

        secondRatingLabel.do { $0.configureLabel("4.0", size: 70, weight: .heavy) }

        secondRatingStarLabel.do {
            $0.configureLabel("★ ★ ★ ★ ☆", alignment: .right, size: 20, weight: .bold)
        }

        secondReviewCountLabel.do {
            $0.configureLabel(
                "8.4만개의 평가",
                color: .systemGray,
                alignment: .right,
                size: 15,
                weight: .bold
            )
        }

        mostHelpfulTitleLabel.do {
            $0.configureLabel("가장 도움이 되는 리뷰", size: 15, weight: .semibold)
        }

        reviewContentView.do {
            $0.backgroundColor = .tertiarySystemBackground
            $0.clipsToBounds = false
            $0.layer.cornerRadius = 20
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.2
            $0.layer.shadowOffset = CGSize(width: 0, height: 2)
            $0.layer.shadowRadius = 5
        }

        reviewTitleLabel.do { $0.configureLabel("앤솝 iOS YB 35기", size: 15, weight: .medium) }

        reviewRatingStarLabel.do {
            $0.configureLabel(
                "★ ★ ★ ★ ★",
                alignment: .left,
                size: 15,
                weight: .medium,
                numberOfLines: 1
            )
        }

        reviewedDateLabel.do {
            $0.configureLabel(
                "10월 13일",
                color: .systemGray,
                size: 15,
                weight: .medium
            )
        }

        reviewerNameLabel.do {
            $0.configureLabel("• INTJ", color: .systemGray, size: 15, weight: .medium)
        }

        reviewInfoStackView.do {
            $0.addArrangedSubview(reviewRatingStarLabel)
            $0.addArrangedSubview(reviewedDateLabel)
            $0.addArrangedSubview(reviewerNameLabel)
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fill
            $0.spacing = 5
        }

        reviewContentLabel.do {
            $0.configureLabel(
                "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한 사람 대한으로 길이 보전하세",
                color: .systemGray,
                size: 15,
                weight: .medium
            )
        }

        tapToRateTitleLabel.do {
            $0.configureLabel(
                "탭하여 평가하기",
                alignment: .center,
                size: 15,
                weight: .semibold
            )
        }

        starsStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .fill
            $0.spacing = 10
        }

        writeReviewButton.do {
            var config = UIButton.Configuration.plain()
            config.baseForegroundColor = .systemBlue
            config.image = UIImage(systemName: "square.and.pencil")?
                .withConfiguration(UIImage.SymbolConfiguration(pointSize: 10, weight: .medium))
            config.imagePadding = 5
            config.attributedTitle = AttributedString(
                NSAttributedString(
                    string: "리뷰 작성",
                    attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .medium)]
                )
            )

            $0.configuration = config
            $0.backgroundColor = .tertiarySystemGroupedBackground
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }

        appSupportButton.do {
            var config = UIButton.Configuration.plain()
            config.baseForegroundColor = .systemBlue
            config.image = UIImage(systemName: "questionmark.circle")?
                .withConfiguration(UIImage.SymbolConfiguration(pointSize: 10, weight: .medium))
            config.imagePadding = 5
            config.attributedTitle = AttributedString(
                NSAttributedString(
                    string: "앱 지원",
                    attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .medium)]
                )
            )

            $0.configuration = config
            $0.backgroundColor = .tertiarySystemGroupedBackground
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }

        writeReviewAndAppSupportStackView.do {
            $0.addArrangedSubview(writeReviewButton)
            $0.addArrangedSubview(appSupportButton)
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 10
        }
    }

    override func setUI() {
        addSubviews(
            ratingAndReviewButton,
            secondRatingLabel,
            secondRatingStarLabel,
            secondReviewCountLabel,
            mostHelpfulTitleLabel,
            reviewContentView,
            reviewTitleLabel,
            reviewInfoStackView,
            reviewContentLabel,
            tapToRateTitleLabel,
            starsStackView,
            writeReviewAndAppSupportStackView
        )

        reviewContentView.addSubviews(
            reviewTitleLabel,
            reviewInfoStackView,
            reviewContentLabel
        )
    }

    override func setLayout() {
        ratingAndReviewButton.snp.makeConstraints {
            $0.top.left.equalToSuperview()
            $0.height.equalTo(30)
        }

        secondRatingLabel.snp.makeConstraints {
            $0.top.equalTo(ratingAndReviewButton.snp.bottom).offset(5)
            $0.left.equalTo(ratingAndReviewButton)
        }

        secondRatingStarLabel.snp.makeConstraints {
            $0.right.equalToSuperview()
        }

        secondReviewCountLabel.snp.makeConstraints {
            $0.top.equalTo(secondRatingStarLabel.snp.bottom).offset(5)
            $0.bottom.equalTo(secondRatingLabel.snp.firstBaseline)
            $0.right.equalTo(secondRatingStarLabel)
        }

        mostHelpfulTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(secondRatingLabel.snp.bottom).offset(10)
            $0.left.equalTo(secondRatingLabel)
        }

        reviewContentView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mostHelpfulTitleLabel.snp.bottom).offset(15)
            $0.left.equalTo(mostHelpfulTitleLabel)
        }

        reviewTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.left.equalTo(20)
        }

        reviewInfoStackView.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(10)
            $0.left.equalTo(reviewTitleLabel)
        }

        reviewContentLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(reviewInfoStackView.snp.bottom).offset(5)
            $0.left.equalTo(reviewInfoStackView)
            $0.bottom.equalToSuperview().inset(20)
        }

        tapToRateTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(reviewContentView.snp.bottom).offset(20)
            $0.left.equalTo(reviewContentView)
        }

        starsStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tapToRateTitleLabel.snp.bottom).offset(5)
            $0.height.equalTo(40)
        }

        writeReviewAndAppSupportStackView.snp.makeConstraints {
            $0.centerX.left.bottom.equalToSuperview()
            $0.top.equalTo(starsStackView.snp.bottom).offset(10)
            $0.height.equalTo(50)
        }
    }
}

// MARK: - UIGestureRecognizerDelegate

extension AppFeedbackSectionView: UIGestureRecognizerDelegate {

    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        return true
    }
}

// MARK: - Submission Alert Configuration

private extension AppFeedbackSectionView {

    func showSubmissionAlert() {
        let alertView = UIView()
        alertView.backgroundColor = .tertiarySystemGroupedBackground
        alertView.clipsToBounds = true
        alertView.layer.cornerRadius = 10
        alertView.alpha = 0

        let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
        starImageView.tintColor = .systemGray
        starImageView.contentMode = .scaleAspectFill

        let titleLabel = UILabel()
        titleLabel.text = "제출됨"
        titleLabel.textColor = .systemGray
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)

        let messageLabel = UILabel()
        messageLabel.text = "피드백을 보내주셔서 감사합니다."
        messageLabel.textColor = .systemGray2
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.font = .systemFont(ofSize: 14, weight: .medium)

        alertView.addSubview(starImageView)
        alertView.addSubview(titleLabel)
        alertView.addSubview(messageLabel)

        addSubview(alertView)

        delegate?.displaySubmissionAlert(alertView)

        starImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(30)
            $0.size.equalTo(100)
        }

        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(starImageView.snp.bottom).offset(10)
            $0.left.equalTo(30)
        }

        messageLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.equalTo(titleLabel)
            $0.bottom.equalTo(alertView.snp.bottom).inset(30)
        }

        UIView.animate(withDuration: 0.2, animations: {
            alertView.alpha = 1
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                UIView.animate(withDuration: 0.3, animations: {
                    alertView.alpha = 0
                }) { _ in
                    alertView.removeFromSuperview()
                }
            }
        }
    }
}

// MARK: - Rating Stars Configuration

private extension AppFeedbackSectionView {

    func configureRatingStarButtons() {
        for i in 0..<starCount {
            let button = UIButton(type: .system)
            button.do {
                $0.tag = i + 1
                $0.setImage(emptyStarImage?
                    .withConfiguration(UIImage.SymbolConfiguration(weight: .semibold)), for: .normal)
                $0.addTarget(self, action: #selector(starTapped), for: .touchUpInside)
                tapToRateButton.append(button)
                starsStackView.addArrangedSubview(button)
            }
        }
    }
}
