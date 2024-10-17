//
//  WriteReviewViewController.swift
//  SecondSeminar
//
//  Created by RAFA on 10/14/24.
//

import UIKit

protocol FeedbackDelegate: AnyObject {

    func updateFeedbackSection(
        title: String,
        rating: Int,
        date: String,
        nickname: String,
        review: String
    )
}

final class WriteReviewViewController: BaseViewController {

    // MARK: - Properties

    weak var feedbackDelegate: FeedbackDelegate?

    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let titleStackView = UIStackView()

    private let dividerView = UIView()

    private let tapToRateTitleLabel = UILabel()
    private var tapToRateButton = [UIButton(type: .system)]
    private let starsStackView = UIStackView()
    private let tapToRateStackView = UIStackView()
    private let emptyStarImage = UIImage(systemName: "star")
    private let filledStarImage = UIImage(systemName: "star.fill")
    private let starCount = 5
    private var currentRating = 0

    private let placeholderText = "선택 사항"

    private let reviewTitleLabel = UILabel()
    private let reviewTitleTextView = UITextView()

    private let textViewDividerView = UIView()

    private let reviewContentTitleLabel = UILabel()
    private let reviewContentTextView = UITextView()

    private let reviewTextInputView = UIView()

    private let nicknameButton = UIButton(type: .system)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setAddTargets()
        setDelegates()
        setNavigationBarStyle()
        configureRatingStarButtons()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setNavigationBarStyle()
    }

    // MARK: - Actions

    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }

    @objc private func submitButtonTapped() {
        let rating = currentRating - 1
        let title = reviewTitleTextView.text
        let review = reviewContentTextView.text
        let nickname = nicknameButton.titleLabel?.text?.replacingOccurrences(of: "별명: ", with: "")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월 dd일"
        let todayDate = dateFormatter.string(from: Date())

        guard let title, let nickname, let review else { return }

        feedbackDelegate?.updateFeedbackSection(
            title: title,
            rating: rating,
            date: todayDate,
            nickname: nickname,
            review: review
        )

        dismiss(animated: true)
    }

    @objc private func starTapped(_ sender: UIButton) {
        currentRating = sender.tag + 1
        updateStarImages()
    }

    @objc private func nicknameButtonTapped() {
        let vc = EditNicknameViewController()
        vc.delegate = self

        if let currentNickname = nicknameButton.titleLabel?.text?.replacingOccurrences(
            of: "별명: ",
            with: ""
        ) {
            vc.bindNickname(currentNickname)
        }

        navigationController?.pushViewController(vc, animated: true)
        navigationItem.title = "뒤로"
    }

    private func setAddTargets() {
        nicknameButton.addTarget(
            self,
            action: #selector(nicknameButtonTapped),
            for: .touchUpInside
        )
    }

    // MARK: - Helpers

    private func setDelegates() {
        reviewTitleTextView.delegate = self
        reviewContentTextView.delegate = self
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

    private func setNavigationBarStyle() {
        navigationItem.title = "리뷰 작성"

        let cancelButton = UIButton(type: .system).then {
            $0.setTitle("취소", for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            $0.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        }

        let submitButton = UIButton(type: .system).then {
            $0.setTitle("제출", for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            $0.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        }

        let cancelBarButtonItem = UIBarButtonItem(customView: cancelButton)
        let submitBarButtonItem = UIBarButtonItem(customView: submitButton)

        navigationItem.leftBarButtonItem = cancelBarButtonItem
        navigationItem.rightBarButtonItem = submitBarButtonItem
    }

    override func setStyle() {
        iconImageView.do {
            $0.image = UIImage(named: "icon")
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }

        titleLabel.do {
            $0.configureLabel("토스", size: 17, weight: .bold)
        }

        subtitleLabel.do {
            $0.configureLabel("금융이 쉬워진다", color: .systemGray, size: 14, weight: .medium)
        }

        titleStackView.do {
            $0.addArrangedSubview(titleLabel)
            $0.addArrangedSubview(subtitleLabel)
            $0.axis = .vertical
            $0.alignment = .leading
            $0.distribution = .fillProportionally
            $0.spacing = 5
        }

        dividerView.do { $0.configureDivider() }

        tapToRateTitleLabel.do {
            $0.text = "탭하여 평가하기:"
            $0.textColor = .systemGray3
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 14, weight: .semibold)
        }

        starsStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .fill
            $0.spacing = 10
        }

        tapToRateStackView.do {
            $0.addArrangedSubview(tapToRateTitleLabel)
            $0.addArrangedSubview(starsStackView)
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 5
        }

        reviewTitleLabel.do {
            $0.text = "제목"
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 17, weight: .medium)
        }

        reviewTitleTextView.do { $0.configureWriteReviewTextView() }

        textViewDividerView.do { $0.configureDivider() }

        reviewContentTitleLabel.do {
            $0.text = "리뷰"
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 17, weight: .medium)
        }

        reviewContentTextView.do { $0.configureWriteReviewTextView() }

        reviewTextInputView.do {
            $0.backgroundColor = .tertiarySystemGroupedBackground
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }

        nicknameButton.do {
            $0.configureButton(
                title: "별명: 심범수",
                fontSize: 15,
                fontWeight: .regular,
                foregroundColor: .systemGray,
                imageName: "chevron.right",
                tintColor: .systemGray,
                pointSize: 12,
                imageWeight: .regular,
                imagePlacement: .trailing,
                imagePadding: 3
            )
        }
    }

    override func setUI() {
        view.addSubviews(
            iconImageView,
            titleStackView,
            dividerView,
            tapToRateStackView,
            reviewTextInputView,
            nicknameButton
        )

        reviewTextInputView.addSubviews(
            reviewTitleLabel,
            reviewTitleTextView,
            textViewDividerView,
            reviewContentTitleLabel,
            reviewContentTextView
        )
    }

    override func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.left.equalTo(20)
            $0.size.equalTo(50)
        }

        titleStackView.snp.makeConstraints {
            $0.centerY.equalTo(iconImageView)
            $0.left.equalTo(iconImageView.snp.right).offset(10)
            $0.right.equalTo(-20)
        }

        dividerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(iconImageView.snp.bottom).offset(40)
            $0.left.equalTo(iconImageView)
            $0.height.equalTo(0.4)
        }

        tapToRateStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(20)
            $0.left.right.equalTo(dividerView)
        }

        reviewTitleLabel.snp.makeConstraints {
            $0.top.equalTo(reviewTextInputView.snp.top).offset(20)
            $0.left.equalTo(20)
            $0.bottom.lessThanOrEqualTo(textViewDividerView.snp.top).offset(-20)
        }

        reviewTitleTextView.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.top)
            $0.left.equalTo(reviewTitleLabel.snp.right).offset(20)
            $0.bottom.equalTo(textViewDividerView.snp.top).offset(-20)
            $0.right.equalTo(-20)
        }

        textViewDividerView.snp.makeConstraints {
            $0.top.equalTo(reviewTitleTextView.snp.bottom).offset(20)
            $0.left.equalTo(reviewTitleLabel)
            $0.right.equalToSuperview()
            $0.height.equalTo(0.4)
        }

        reviewContentTitleLabel.snp.makeConstraints {
            $0.top.equalTo(textViewDividerView.snp.bottom).offset(20)
            $0.left.equalTo(reviewTitleLabel.snp.left)
            $0.bottom.lessThanOrEqualTo(reviewTextInputView.snp.bottom).offset(-20)
        }

        reviewContentTextView.snp.makeConstraints {
            $0.top.equalTo(reviewContentTitleLabel.snp.top)
            $0.left.equalTo(reviewContentTitleLabel.snp.right).offset(20)
            $0.bottom.equalTo(reviewTextInputView.snp.bottom).offset(-20)
            $0.right.equalTo(-20)
        }

        reviewTextInputView.snp.makeConstraints {
            $0.top.equalTo(tapToRateStackView.snp.bottom).offset(30)
            $0.left.right.equalTo(tapToRateStackView)
        }

        nicknameButton.snp.makeConstraints {
            $0.top.equalTo(reviewTextInputView.snp.bottom).offset(10)
            $0.left.equalTo(reviewTextInputView)
            $0.height.equalTo(40)
        }
    }
}

// MARK: - UITextViewDelegate

extension WriteReviewViewController: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText {
            textView.text = nil
            textView.textColor = .label
            textView.font = .systemFont(ofSize: 17, weight: .medium)
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .systemGray2
            textView.font = .systemFont(ofSize: 17, weight: .medium)
        }
    }
}

// MARK: - EditNicknameViewControllerDelegate

extension WriteReviewViewController: EditNicknameViewControllerDelegate {

    func didUpdateNickname(_ nickname: String) {
        var config = nicknameButton.configuration
        config?.attributedTitle = AttributedString(
            NSAttributedString(
                string: "별명: \(nickname)",
                attributes: [
                    .font: UIFont.systemFont(ofSize: 15, weight: .regular)
                ]
            )
        )

        nicknameButton.configuration = config
    }
}

// MARK: - UI Helpers

private extension WriteReviewViewController {

    func configureRatingStarButtons() {
        for i in 0..<starCount {
            let button = UIButton(type: .system)
            button.do {
                $0.tag = i + 1
                $0.setImage(emptyStarImage?
                    .withConfiguration(UIImage.SymbolConfiguration(weight: .medium)), for: .normal)
                $0.addTarget(self, action: #selector(starTapped), for: .touchUpInside)
                tapToRateButton.append(button)
                starsStackView.addArrangedSubview(button)
            }
        }
    }
}
