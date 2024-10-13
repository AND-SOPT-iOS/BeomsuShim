//
//  AppDetailViewController.swift
//  SecondSeminar
//
//  Created by RAFA on 10/13/24.
//

import UIKit

final class AppDetailViewController: BaseViewController {

    // MARK: - Properties

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let tossIcon = UIImageView()

    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let titleStackView = UIStackView()

    private let installButton = UIButton(type: .system)
    private let shareButton = UIButton(type: .system)

    private let firstHorizontalDividerView = UIView()

    private let firstReviewCountLabel = UILabel()
    private let firstRatingLabel = UILabel()
    private let firstRatingStarLabel = UILabel()
    private let firstRatingImageView = UIImageView()
    private let ratingInfoStackView = UIStackView()

    private let firstVerticalDividerView = UIView()

    private let prizeTitleLabel = UILabel()
    private let prizeSubtitleLabel = UILabel()
    private let prizeCategoryLabel = UILabel()
    private let prizeInfoStackView = UIStackView()

    private let secondVerticalDividerView = UILabel()

    private let ageTitleLabel = UILabel()
    private let ageInfoLabel = UILabel()
    private let yearsOldLabel = UILabel()
    private let ageInfoStackView = UIStackView()

    private let secondHorizontalDividerView = UIView()

    private let whatsNewButton = UIButton(type: .system)
    private let versionLabel = UILabel()
    private let updatedTimeLabel = UILabel()
    private let updatedDescriptionLabel = UILabel()

    private let previewTitleLabel = UILabel()
    private let previewImageView = UIImageView()
    private let supportDeviceImageView = UIImageView()
    private let supportDeviceLabel = UILabel()

    private let thirdHorizontalDividerView = UIView()

    private let descriptionLabel = UILabel()
    private let developerNameButton = DeveloperNameButton()

    private let ratingAndReviewButton = UIButton(type: .system)
    private let secondRatingLabel = UILabel()
    private let secondRatingStarLabel = UILabel()
    private let secondReviewCountLabel = UILabel()

    private let mostHelpfulTitleLabel = UILabel()
    private let reviewContentView = UIView()
    private let reviewTitleLabel = UILabel()
    private let reviewRatingStarLabel = UILabel()
    private let reviewedDateLabel = UILabel()
    private let reviewerNameLabel = UILabel()
    private let reviewSubtitleStackView = UIStackView()
    private let reviewContentLabel = UILabel()

    private let tapToRateTitleLabel = UILabel()

    private var tapToRateButton = [UIButton(type: .system)]
    private let starsStackView = UIStackView()
    private let emptyStarImage = UIImage(systemName: "star")
    private let filledStarImage = UIImage(systemName: "star.fill")
    private let starCount = 5
    private var currentRating = 0

    private let writeReviewButton = UIButton(type: .system)
    private let appSupportButton = UIButton(type: .system)
    private let writeReviewAndAppSupportStackView = UIStackView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegates()
        setNavigationBarStyle()
        configureRatingStarButtons()
        setPanGesture()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        reviewContentView.layer.shadowPath = UIBezierPath(roundedRect: reviewContentView.bounds, cornerRadius: 20).cgPath
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

    private func setDelegates() {
        scrollView.delegate = self
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

    private func showSubmissionAlert() {
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

        view.addSubview(alertView)

        alertView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

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

    // MARK: - UI

    private func setNavigationBarStyle() {
        navigationItem.titleView = nil
    }

    override func setStyle() {
        view.backgroundColor = .systemBackground

        scrollView.do {
            $0.automaticallyAdjustsScrollIndicatorInsets = false
        }

        tossIcon.do {
            $0.image = UIImage(named: "icon")
            $0.backgroundColor = .white
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor.systemGray4.cgColor
        }

        iconImageView.do {
            $0.image = UIImage(named: "icon")
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor.systemGray4.cgColor
        }

        titleLabel.do {
            $0.text = "토스"
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 20, weight: .semibold)
        }

        subtitleLabel.do {
            $0.text = "금융이 쉬워진다"
            $0.textColor = .systemGray
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 14, weight: .semibold)
        }

        titleStackView.do {
            $0.addArrangedSubview(titleLabel)
            $0.addArrangedSubview(subtitleLabel)
            $0.axis = .vertical
            $0.alignment = .leading
            $0.distribution = .fillProportionally
            $0.spacing = 3
        }

        installButton.do {
            $0.backgroundColor = .systemBlue
            $0.setAttributedTitle(
                NSAttributedString(
                    string: "받기",
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 15, weight: .bold),
                        .foregroundColor: UIColor.white
                    ]
                ),
                for: .normal
            )
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }

        shareButton.do {
            $0.setImage(UIImage(systemName: "square.and.arrow.up")?
                .withConfiguration(UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
        }

        firstHorizontalDividerView.do {
            $0.backgroundColor = .systemGray2
        }

        firstReviewCountLabel.do {
            $0.text = "8.4만개의 평가"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 12, weight: .bold)
        }

        firstRatingLabel.do {
            $0.text = "4.0"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }

        firstRatingStarLabel.do {
            $0.text = "★★★★☆"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 17, weight: .regular)
        }

        ratingInfoStackView.do {
            $0.addArrangedSubview(firstReviewCountLabel)
            $0.addArrangedSubview(firstRatingLabel)
            $0.addArrangedSubview(firstRatingStarLabel)
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .fillProportionally
            $0.spacing = 5
        }

        firstVerticalDividerView.do {
            $0.backgroundColor = .systemGray2
        }

        prizeTitleLabel.do {
            $0.text = "수상"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
        }

        prizeCategoryLabel.do {
            $0.text = "에디터의\n선택"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 10, weight: .bold)
        }

        prizeSubtitleLabel.do {
            $0.text = "앱"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
        }

        prizeInfoStackView.do {
            $0.addArrangedSubview(prizeTitleLabel)
            $0.addArrangedSubview(prizeCategoryLabel)
            $0.addArrangedSubview(prizeSubtitleLabel)
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .fillProportionally
            $0.spacing = 5
        }

        secondVerticalDividerView.do {
            $0.backgroundColor = .systemGray2
        }

        ageTitleLabel.do {
            $0.text = "연령"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
        }

        ageInfoLabel.do {
            $0.text = "4+"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }

        yearsOldLabel.do {
            $0.text = "세"
            $0.textColor = .systemGray
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
        }

        ageInfoStackView.do {
            $0.addArrangedSubview(ageTitleLabel)
            $0.addArrangedSubview(ageInfoLabel)
            $0.addArrangedSubview(yearsOldLabel)
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .fillProportionally
            $0.spacing = 5
        }

        secondHorizontalDividerView.do {
            $0.backgroundColor = .systemGray2
        }

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
            $0.tintColor = .systemGray2
        }

        supportDeviceLabel.do {
            $0.text = "iPhone"
            $0.textColor = .systemGray2
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
        }

        thirdHorizontalDividerView.do {
            $0.backgroundColor = .systemGray2
        }

        descriptionLabel.do {
            let text = "토스뱅크, 토스증권은 SOPT 같은 인재들을 찾습니다."
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

        secondRatingLabel.do {
            $0.text = "4.0"
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 70, weight: .semibold)
        }

        secondRatingStarLabel.do {
            $0.text = "★ ★ ★ ★ ☆"
            $0.textAlignment = .right
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }

        secondReviewCountLabel.do {
            $0.text = "8.4만개의 평가"
            $0.textColor = .systemGray
            $0.textAlignment = .right
            $0.font = .systemFont(ofSize: 15, weight: .bold)
        }

        mostHelpfulTitleLabel.do {
            $0.text = "가장 도움이 되는 리뷰"
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
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

        reviewTitleLabel.do {
            $0.text = "토스 UX 전버전으로 해주세요"
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 15, weight: .medium)
        }

        reviewRatingStarLabel.do {
            $0.text = "★ ★ ★ ★ ★"
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 15, weight: .medium)
        }

        reviewedDateLabel.do {
            $0.text = "9월 27일"
            $0.textColor = .systemGray
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 15, weight: .medium)
        }

        reviewerNameLabel.do {
            $0.text = "• 흑 운영자님 ㅠㅠ"
            $0.textColor = .systemGray
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 15, weight: .medium)
        }

        reviewSubtitleStackView.do {
            $0.addArrangedSubview(reviewRatingStarLabel)
            $0.addArrangedSubview(reviewedDateLabel)
            $0.addArrangedSubview(reviewerNameLabel)
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fill
            $0.spacing = 5
        }

        reviewContentLabel.do {
            $0.text = """
            최근 업데이트가 토스 만의 ux 색깔 개성자체를 잃어버린 것 같습니다. 메인 화면 볼때마다 되게 부드럽고 한눈에 보기 편했는데, 이번 업데이트로 인해 딱딱해진것 같네요. 새로움을 지향하는건 좋으나 이용자들에게 강제가 아닌 선택할 수 있는 옵션이라도 만들어 주셨으면 어떨까요?
            """
            $0.textColor = .systemGray
            $0.textAlignment = .left
            $0.numberOfLines = 0
            $0.font = .systemFont(ofSize: 15, weight: .medium)
        }

        tapToRateTitleLabel.do {
            $0.text = "탭하여 평가하기"
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(iconImageView)
        contentView.addSubview(titleStackView)
        contentView.addSubview(installButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(firstHorizontalDividerView)
        contentView.addSubview(ratingInfoStackView)
        contentView.addSubview(firstVerticalDividerView)
        contentView.addSubview(prizeInfoStackView)
        contentView.addSubview(secondVerticalDividerView)
        contentView.addSubview(ageInfoStackView)
        contentView.addSubview(secondHorizontalDividerView)
        contentView.addSubview(whatsNewButton)
        contentView.addSubview(versionLabel)
        contentView.addSubview(updatedTimeLabel)
        contentView.addSubview(updatedDescriptionLabel)
        contentView.addSubview(previewTitleLabel)
        contentView.addSubview(previewImageView)
        contentView.addSubview(supportDeviceImageView)
        contentView.addSubview(supportDeviceLabel)
        contentView.addSubview(thirdHorizontalDividerView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(developerNameButton)
        contentView.addSubview(ratingAndReviewButton)
        contentView.addSubview(secondRatingLabel)
        contentView.addSubview(secondRatingStarLabel)
        contentView.addSubview(secondReviewCountLabel)
        contentView.addSubview(mostHelpfulTitleLabel)
        contentView.addSubview(reviewContentView)

        reviewContentView.addSubview(reviewTitleLabel)
        reviewContentView.addSubview(reviewSubtitleStackView)
        reviewContentView.addSubview(reviewContentLabel)

        contentView.addSubview(tapToRateTitleLabel)
        contentView.addSubview(starsStackView)
        contentView.addSubview(writeReviewAndAppSupportStackView)
    }

    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.bottom.right.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }

        tossIcon.snp.makeConstraints {
            $0.size.equalTo(25)
        }

        iconImageView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(5)
            $0.left.equalToSuperview().inset(20)
            $0.size.equalTo(120)
        }

        titleStackView.snp.makeConstraints {
            $0.top.equalTo(iconImageView)
            $0.left.equalTo(iconImageView.snp.right).offset(15)
            $0.right.equalTo(-20)
        }

        installButton.snp.makeConstraints {
            $0.left.equalTo(titleStackView)
            $0.bottom.equalTo(iconImageView)
            $0.width.equalTo(80)
            $0.height.equalTo(30)
        }

        shareButton.snp.makeConstraints {
            $0.centerY.equalTo(installButton)
            $0.right.equalTo(-20)
            $0.size.equalTo(30)
        }

        firstHorizontalDividerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(iconImageView.snp.bottom).offset(20)
            $0.left.equalTo(iconImageView)
            $0.height.equalTo(0.4)
        }

        ratingInfoStackView.snp.makeConstraints {
            $0.top.equalTo(firstHorizontalDividerView.snp.bottom).offset(20)
            $0.left.equalTo(firstHorizontalDividerView).offset(10)
        }

        firstVerticalDividerView.snp.makeConstraints {
            $0.centerY.equalTo(ratingInfoStackView)
            $0.left.equalTo(ratingInfoStackView.snp.right).offset(20)
            $0.width.equalTo(0.3)
            $0.height.equalTo(40)
        }

        prizeInfoStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(ratingInfoStackView)
            $0.left.equalTo(firstVerticalDividerView.snp.right).offset(20)
        }

        secondVerticalDividerView.snp.makeConstraints {
            $0.centerY.equalTo(firstVerticalDividerView)
            $0.left.equalTo(prizeInfoStackView.snp.right).offset(20)
            $0.width.equalTo(0.3)
            $0.height.equalTo(40)
        }

        ageInfoStackView.snp.makeConstraints {
            $0.top.equalTo(prizeInfoStackView)
            $0.left.equalTo(secondVerticalDividerView.snp.right).offset(20)
            $0.right.equalTo(firstHorizontalDividerView.snp.right).offset(-10)
        }

        secondHorizontalDividerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(prizeInfoStackView.snp.bottom).offset(20)
            $0.left.equalTo(firstHorizontalDividerView)
            $0.height.equalTo(0.4)
        }

        whatsNewButton.snp.makeConstraints {
            $0.top.equalTo(secondHorizontalDividerView.snp.bottom).offset(10)
            $0.left.equalTo(secondHorizontalDividerView)
            $0.height.equalTo(30)
        }

        versionLabel.snp.makeConstraints {
            $0.top.equalTo(whatsNewButton.snp.bottom).offset(10)
            $0.left.equalTo(whatsNewButton)
        }

        updatedTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(versionLabel)
            $0.right.equalTo(secondHorizontalDividerView)
        }

        updatedDescriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(versionLabel.snp.bottom).offset(15)
            $0.left.equalTo(versionLabel)
        }

        previewTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(updatedDescriptionLabel.snp.bottom).offset(30)
            $0.left.equalTo(updatedDescriptionLabel)
        }

        previewImageView.snp.makeConstraints {
            $0.top.equalTo(previewTitleLabel.snp.bottom).offset(10)
            $0.left.equalTo(previewTitleLabel)
            $0.width.equalTo(contentView.snp.width).multipliedBy(0.6)
            $0.height.equalTo(450)
        }

        supportDeviceImageView.snp.makeConstraints {
            $0.top.equalTo(previewImageView.snp.bottom).offset(10)
            $0.left.equalTo(previewImageView)
            $0.width.equalTo(20)
            $0.height.equalTo(25)
        }

        supportDeviceLabel.snp.makeConstraints {
            $0.centerY.equalTo(supportDeviceImageView)
            $0.left.equalTo(supportDeviceImageView.snp.right).offset(10)
            $0.right.equalTo(previewTitleLabel)
        }

        thirdHorizontalDividerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(supportDeviceImageView.snp.bottom).offset(20)
            $0.left.equalTo(secondHorizontalDividerView)
            $0.height.equalTo(0.4)
        }

        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(thirdHorizontalDividerView.snp.bottom).offset(20)
            $0.left.equalTo(thirdHorizontalDividerView)
        }

        developerNameButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.left.equalTo(descriptionLabel)
            $0.height.equalTo(30)
        }

        ratingAndReviewButton.snp.makeConstraints {
            $0.top.equalTo(developerNameButton.snp.bottom).offset(40)
            $0.left.equalTo(developerNameButton)
            $0.height.equalTo(30)
        }

        secondRatingLabel.snp.makeConstraints {
            $0.top.equalTo(ratingAndReviewButton.snp.bottom).offset(5)
            $0.left.equalTo(ratingAndReviewButton)
        }

        secondRatingStarLabel.snp.makeConstraints {
            $0.right.equalTo(developerNameButton)
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

        reviewSubtitleStackView.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(10)
            $0.left.equalTo(reviewTitleLabel)
        }

        reviewContentLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(reviewSubtitleStackView.snp.bottom).offset(5)
            $0.left.equalTo(reviewSubtitleStackView)
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
            $0.centerX.equalToSuperview()
            $0.top.equalTo(starsStackView.snp.bottom).offset(10)
            $0.left.equalTo(reviewContentView)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-20)
            $0.height.equalTo(50)
        }
    }
}

// MARK: - UIScrollViewDelegate

extension AppDetailViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let navigationBar = navigationController?.navigationBar else { return }

        let offsetY = scrollView.contentOffset.y
        let installButton = UIButton(type: .system)
        installButton.backgroundColor = .systemBlue
        installButton.setAttributedTitle(
            NSAttributedString(
                string: "받기",
                attributes: [
                    .font: UIFont.systemFont(ofSize: 15, weight: .bold),
                    .foregroundColor: UIColor.white
                ]
            ),
            for: .normal
        )
        installButton.clipsToBounds = true
        installButton.layer.cornerRadius = 15
        installButton.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
        let rightBarButtonItem = UIBarButtonItem(customView: installButton)

        if offsetY > 50 {
            if navigationItem.titleView == nil {
                UIView.transition(
                    with: navigationBar,
                    duration: 0.3,
                    options: .transitionCrossDissolve,
                    animations: {
                        self.navigationItem.titleView = self.tossIcon
                        self.navigationItem.rightBarButtonItem = rightBarButtonItem
                    },
                    completion: nil)
            }
        } else {
            if navigationItem.titleView != nil {
                UIView.transition(
                    with: navigationBar,
                    duration: 0.3,
                    options: .transitionCrossDissolve,
                    animations: {
                        self.navigationItem.titleView = nil
                        self.navigationItem.rightBarButtonItem = nil
                    },
                    completion: nil)
            }
        }
    }
}

// MARK: - UIGestureRecognizerDelegate

extension AppDetailViewController: UIGestureRecognizerDelegate {

    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        return true
    }
}

// MARK: - Rating Stars Configuration

private extension AppDetailViewController {

    func configureRatingStarButtons() {
        for i in 0..<starCount {
            let button = UIButton(type: .system)
            button.do {
                $0.tag = i + 1
                $0.setImage(emptyStarImage?
                    .withConfiguration(UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
                $0.addTarget(self, action: #selector(starTapped), for: .touchUpInside)
                tapToRateButton.append(button)
                starsStackView.addArrangedSubview(button)
            }
        }
    }
}
