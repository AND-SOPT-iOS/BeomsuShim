//
//  AppDetailViewController.swift
//  SecondSeminar
//
//  Created by RAFA on 10/13/24.
//

import UIKit

final class AppDetailViewController: BaseViewController {

    // MARK: - Properties

    private let tossIcon = UIImageView()

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let appDetailHeaderView = AppDetailHeaderView()
    private let appMetaInfoSectionView = AppMetaInfoSectionView()
    private let whatsNewSectionView = WhatsNewSectionView()
    private let previewSectionView = PreviewSectionView()
    private let developerInfoSectionView = DeveloperInfoSectionView()
    private let appFeedbackSectionView = AppFeedbackSectionView()

    private let firstHorizontalDividerView = UIView()
    private let secondHorizontalDividerView = UIView()
    private let thirdHorizontalDividerView = UIView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setAddTargets()
        setDelegates()
        setNavigationBarStyle()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setNavigationBarStyle()
    }

    // MARK: - Actions

    @objc private func navigateToVersionHistoryVC() {
        navigateTo(VersionHistoryViewController())
    }

    @objc private func navigateToDeveloperAppVC() {
        navigateTo(DeveloperAppViewController())
    }

    @objc private func navigateToSeeAllReviewVC() {
        navigateTo(SeeAllReviewViewController())
    }

    @objc private func navigateToWriteReviewVC() {
        let vc = WriteReviewViewController()
        vc.feedbackDelegate = self
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }

    @objc private func openAppSupportWebsite() {
        if let url = URL(string: "https://toss.im") {
            UIApplication.shared.open(url, options: [:])
        }
    }

    // MARK: - Helpers

    private func setAddTargets() {
        whatsNewSectionView.whatsNewButton.addTarget(
            self,
            action: #selector(navigateToVersionHistoryVC),
            for: .touchUpInside
        )

        developerInfoSectionView.developerNameButton.button.addTarget(
            self,
            action: #selector(navigateToDeveloperAppVC),
            for: .touchUpInside
        )

        appFeedbackSectionView.ratingAndReviewButton.addTarget(
            self,
            action: #selector(navigateToSeeAllReviewVC),
            for: .touchUpInside
        )

        appFeedbackSectionView.writeReviewButton.addTarget(
            self,
            action: #selector(navigateToWriteReviewVC),
            for: .touchUpInside
        )

        appFeedbackSectionView.appSupportButton.addTarget(
            self,
            action: #selector(openAppSupportWebsite),
            for: .touchUpInside
        )
    }

    private func setDelegates() {
        scrollView.delegate = self
        appFeedbackSectionView.delegate = self
    }

    private func navigateTo(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
        navigationItem.title = "뒤로"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - UI

    private func setNavigationBarStyle() {
        navigationItem.titleView = nil
        navigationItem.title = ""
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    override func setStyle() {
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
            $0.layer.borderColor = UIColor.systemGray5.cgColor
        }

        firstHorizontalDividerView.do { $0.configureDivider() }
        secondHorizontalDividerView.do { $0.configureDivider() }
        thirdHorizontalDividerView.do { $0.configureDivider() }
    }

    override func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        for section in AppDetailSection.allCases {
            switch section {
            case .header: contentView.addSubview(appDetailHeaderView)
            case .metaInfo: contentView.addSubview(appMetaInfoSectionView)
            case .whatsNew: contentView.addSubview(whatsNewSectionView)
            case .preview: contentView.addSubview(previewSectionView)
            case .developerInfo: contentView.addSubview(developerInfoSectionView)
            case .feedback: contentView.addSubview(appFeedbackSectionView)
            }
        }

        contentView.addSubviews(
            firstHorizontalDividerView,
            secondHorizontalDividerView,
            thirdHorizontalDividerView
        )
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
            $0.size.equalTo(28)
        }

        appDetailHeaderView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(5)
            $0.left.right.equalToSuperview().inset(20)
        }

        firstHorizontalDividerView.snp.makeConstraints {
            $0.top.equalTo(appDetailHeaderView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(0.4)
        }

        appDetailHeaderView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(5)
            $0.left.right.equalToSuperview().inset(20)
        }

        firstHorizontalDividerView.snp.makeConstraints {
            $0.top.equalTo(appDetailHeaderView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(0.4)
        }

        appMetaInfoSectionView.snp.makeConstraints {
            $0.top.equalTo(firstHorizontalDividerView.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(20)
        }

        secondHorizontalDividerView.snp.makeConstraints {
            $0.top.equalTo(appMetaInfoSectionView.snp.bottom).offset(8)
            $0.left.right.equalTo(appMetaInfoSectionView)
            $0.height.equalTo(0.4)
        }

        whatsNewSectionView.snp.makeConstraints {
            $0.top.equalTo(secondHorizontalDividerView.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(20)
        }

        previewSectionView.snp.makeConstraints {
            $0.top.equalTo(whatsNewSectionView.snp.bottom).offset(30)
            $0.left.right.equalToSuperview().inset(20)
        }

        thirdHorizontalDividerView.snp.makeConstraints {
            $0.top.equalTo(previewSectionView.snp.bottom).offset(20)
            $0.left.right.equalTo(previewSectionView)
            $0.height.equalTo(0.4)
        }

        developerInfoSectionView.snp.makeConstraints {
            $0.top.equalTo(thirdHorizontalDividerView.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(20)
        }

        appFeedbackSectionView.snp.makeConstraints {
            $0.top.equalTo(developerInfoSectionView.snp.bottom).offset(30)
            $0.left.bottom.right.equalToSuperview().inset(20)
        }
    }
}

// MARK: - UIScrollViewDelegate

extension AppDetailViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let rightBarButtonItem = createInstallButtonBarItem()

        if offsetY > 50 {
            if navigationItem.titleView == nil {
                updateNavigationBar(
                    with: tossIcon,
                    rightBarButtonItem: rightBarButtonItem
                )
            }
        } else {
            if navigationItem.titleView != nil {
                resetNavigationBar()
            }
        }
    }

    private func createInstallButtonBarItem() -> UIBarButtonItem {
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
        return UIBarButtonItem(customView: installButton)
    }

    private func updateNavigationBar(
        with titleView: UIView?,
        rightBarButtonItem: UIBarButtonItem?
    ) {
        guard let navigationBar = navigationController?.navigationBar else { return }

        UIView.transition(
            with: navigationBar,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: {
                self.navigationItem.titleView = titleView
                self.navigationItem.rightBarButtonItem = rightBarButtonItem
            },
            completion: nil
        )
    }

    private func resetNavigationBar() {
        updateNavigationBar(with: nil, rightBarButtonItem: nil)
    }
}

// MARK: - AppFeedbackSectionDelegate

extension AppDetailViewController: SubmissionDelegate {

    func displaySubmissionAlert(_ alertView: UIView) {
        view.addSubview(alertView)

        alertView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

// MARK: - FeedbackDelegate

extension AppDetailViewController: FeedbackDelegate {

    func updateFeedbackSection(
        title: String,
        rating: Int,
        date: String,
        nickname: String,
        review: String
    ) {
        appFeedbackSectionView.reviewTitleLabel.text = title
        appFeedbackSectionView.reviewRatingStarLabel.text = String(
            repeating: "★",
            count: rating
        ) + String(
            repeating: "☆",
            count: appFeedbackSectionView.starCount - rating
        )
        appFeedbackSectionView.reviewedDateLabel.text = date
        appFeedbackSectionView.reviewerNameLabel.text = "• \(nickname)"
        appFeedbackSectionView.reviewContentLabel.text = review
    }
}
