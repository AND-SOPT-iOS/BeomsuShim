//
//  FinanceItem.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/29/24.
//

import UIKit

protocol FinanceItem: Hashable {
    var appIcon: String { get }
    var title: String { get }
    var subtitle: String { get }
    var downloadState: DownloadState { get }
    var price: Int? { get }
}

enum FinanceItemType: Hashable {
    case featured(Featured)
    case essential(Essential)
}

enum DownloadState {
    case installed
    case install
    case reinstall
    case update
    case paid

    var buttonTitle: String {
        switch self {
        case .installed:
            return "열기"
        case .install:
            return "받기"
        case .reinstall:
            return "icloud.and.arrow.down"
        case .update:
            return "업데이트"
        case .paid:
            return "₩"
        }
    }
}

struct Featured: FinanceItem {
    let id = UUID()
    let category: String
    let title: String
    let description: String
    let appIcon: String
    let subtitle: String
    let downloadState: DownloadState
    let price: Int?
    let hasInAppPurchases: Bool
    let backgroundColor: UIColor
}

struct Essential: FinanceItem {
    let id = UUID()
    let appIcon: String
    let title: String
    let subtitle: String
    let downloadState: DownloadState
    let price: Int?
    let hasInAppPurchases: Bool
}

struct PaidRanking: FinanceItem {
    let id = UUID()
    let appIcon: String
    let title: String
    let subtitle: String
    let downloadState: DownloadState
    let price: Int?
    let hasInAppPurchases: Bool
}

struct FreeRanking: FinanceItem {
    let id = UUID()
    let appIcon: String
    let title: String
    let subtitle: String
    let downloadState: DownloadState
    let price: Int?
    let hasInAppPurchases: Bool
}

// MARK: - Mock Data

extension Featured {

    static let featuredItems: [Featured] = [
        .init(
            category: "새로운 경험",
            title: "Fortune City - A Finance App",
            description: "게임을 하듯 관리하는 가계부",
            appIcon: "hyundaicard",
            subtitle: "좋은 소비습관을 만들어 보세요!",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: true,
            backgroundColor: .tertiarySystemGroupedBackground
        ),
        .init(
            category: "추천",
            title: "Taxnote 부기 및 회계 앱",
            description: "간편한 장부 관리",
            appIcon: "hyundaidepartment",
            subtitle: "자영업자용 세금 환급을 위한 부기 및 회계 앱",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: false,
            backgroundColor: .systemIndigo
        ),
        .init(
            category: "추천",
            title: "Currenzy",
            description: "빠르고 쉬운 환율 계산",
            appIcon: "kakaobank",
            subtitle: "금융",
            downloadState: .paid,
            price: 6_600,
            hasInAppPurchases: true,
            backgroundColor: .systemPurple
        ),
        .init(
            category: "새로운 경험",
            title: "Elk - 여행 환율 변환기",
            description: "언제 어디서나 간편한 환율 체크",
            appIcon: "kakaopay",
            subtitle: "Winner of ADA 2017",
            downloadState: .installed,
            price: nil,
            hasInAppPurchases: false,
            backgroundColor: .systemPink
        )
    ]
}

extension Essential {

    static let essentialItems: [Essential] = [
        .init(
            appIcon: "kbank",
            title: "Fin - 가계부 및 예산 추적기",
            subtitle: "당신의 돈은 어디로 가고 있을까요?",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random()
        ),
        .init(
            appIcon: "kbpay",
            title: "Buddy: Budget Planner App",
            subtitle: "금융",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random()
        ),
        .init(
            appIcon: "mobileTmoney",
            title: "YNAB",
            subtitle: "금융",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random()
        ),
        .init(
            appIcon: "monimo",
            title: "Splitwise",
            subtitle: "금융",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random()
        ),
        .init(
            appIcon: "naverpay",
            title: "Money Coach Budget Manager Pro",
            subtitle: "Expense Tracker, Bill Planner",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random()
        ),
        .init(
            appIcon: "pass",
            title: "CardPointers for Credit Cards",
            subtitle: "금융",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random()
        ),
        .init(
            appIcon: "silson24",
            title: "iFinance 5",
            subtitle: "금융",
            downloadState: .paid,
            price: 29_000,
            hasInAppPurchases: Bool.random()
        ),
        .init(
            appIcon: "toss",
            title: "MoneyStats - Budget Planner",
            subtitle: "금융",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random()
        ),
        .init(
            appIcon: "hyundaicard",
            title: "Pockey - 포켓 머니 매니저",
            subtitle: "용돈 관리 등",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random()
        ),
        .init(
            appIcon: "hyundaidepartment",
            title: "MarketWatch - News & Data",
            subtitle: "금융",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random()
        ),
        .init(
            appIcon: "kakaobank",
            title: "MoneyControl Spending Tracker",
            subtitle: "금융",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random()
        ),
        .init(
            appIcon: "kakaopay",
            title: "Spendy - Spendings reimagined",
            subtitle: "금융",
            downloadState: .paid,
            price: 4_400,
            hasInAppPurchases: Bool.random()
        )
    ]
}
