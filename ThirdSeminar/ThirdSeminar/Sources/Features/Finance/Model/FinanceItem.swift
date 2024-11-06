//
//  FinanceItem.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/29/24.
//

import UIKit

enum FeaturedCategory {
    case new, recommended

    var categoryTitle: String {
        switch self {
        case .new: return "새로운 경험"
        case .recommended: return "추천"
        }
    }
}

enum DownloadState {
    case installed
    case install
    case reinstall
    case update
    case paid

    var buttonTitle: String {
        switch self {
        case .installed: return "열기"
        case .install: return "받기"
        case .reinstall: return "icloud.and.arrow.down"
        case .update: return "업데이트"
        case .paid: return "₩"
        }
    }
}

struct Item: Hashable {
    let id = UUID()
    let sectionType: FinanceSectionKind
    let category: FeaturedCategory?
    let title: String
    let description: String?
    let appIcon: String
    let subtitle: String
    let downloadState: DownloadState
    let price: Int?
    let hasInAppPurchases: Bool
    let backgroundColor: UIColor?
}

// MARK: - Mock Data

extension Item {

    static let items: [Item] = [

        // MARK: - Featured

        .init(
            sectionType: .featured,
            category: .new,
            title: "Fortune City - A Finance App",
            description: "게임을 하듯 관리하는 가계부",
            appIcon: "1",
            subtitle: "좋은 소비습관을 만들어 보세요!",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: true,
            backgroundColor: .tertiarySystemGroupedBackground
        ),
        .init(
            sectionType: .featured,
            category: .recommended,
            title: "Taxnote 부기 및 회계 앱",
            description: "간편한 장부 관리",
            appIcon: "4",
            subtitle: "자영업자용 세금 환급을 위한 부기 및 회계 앱",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: false,
            backgroundColor: .systemIndigo
        ),
        .init(
            sectionType: .featured,
            category: .recommended,
            title: "Currenzy",
            description: "빠르고 쉬운 환율 계산",
            appIcon: "2",
            subtitle: "금융",
            downloadState: .paid,
            price: 6_600,
            hasInAppPurchases: true,
            backgroundColor: .systemPurple
        ),
        .init(
            sectionType: .featured,
            category: .new,
            title: "Elk - 여행 환율 변환기",
            description: "언제 어디서나 간편한 환율 체크",
            appIcon: "0",
            subtitle: "Winner of ADA 2017",
            downloadState: .installed,
            price: nil,
            hasInAppPurchases: false,
            backgroundColor: .systemPink
        ),

        // MARK: - Essential

        .init(
            sectionType: .essential,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "0",
            subtitle: "금융이 쉬워진다",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .essential,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "1",
            subtitle: "금융이 쉬워진다",
            downloadState: .installed,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .essential,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "2",
            subtitle: "금융이 쉬워진다",
            downloadState: .reinstall,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .essential,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "3",
            subtitle: "금융이 쉬워진다",
            downloadState: .update,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .essential,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "4",
            subtitle: "금융이 쉬워진다",
            downloadState: .paid,
            price: 6_600,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .essential,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "5",
            subtitle: "금융이 쉬워진다",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .essential,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "6",
            subtitle: "금융이 쉬워진다",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .essential,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "7",
            subtitle: "금융이 쉬워진다",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .essential,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "8",
            subtitle: "금융이 쉬워진다",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),

        // MARK: - Paid Ranking

        .init(
            sectionType: .paidRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "0",
            subtitle: "금융이 쉬워진다",
            downloadState: .paid,
            price: 500,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .paidRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "11",
            subtitle: "금융이 쉬워진다",
            downloadState: .paid,
            price: 32_000,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .paidRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "10",
            subtitle: "금융이 쉬워진다",
            downloadState: .paid,
            price: 1_200,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .paidRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "9",
            subtitle: "금융이 쉬워진다",
            downloadState: .paid,
            price: 5_400,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .paidRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "8",
            subtitle: "금융이 쉬워진다",
            downloadState: .paid,
            price: 100,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .paidRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "7",
            subtitle: "금융이 쉬워진다",
            downloadState: .paid,
            price: 7_000,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .paidRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "6",
            subtitle: "금융이 쉬워진다",
            downloadState: .paid,
            price: 12_000,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .paidRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "5",
            subtitle: "금융이 쉬워진다",
            downloadState: .paid,
            price: 1_100,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .paidRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "4",
            subtitle: "금융이 쉬워진다",
            downloadState: .paid,
            price: 14_000,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),

        // MARK: - Free Ranking

        .init(
            sectionType: .freeRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "0",
            subtitle: "금융이 쉬워진다",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .freeRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "3",
            subtitle: "금융이 쉬워진다",
            downloadState: .installed,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .freeRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "2",
            subtitle: "금융이 쉬워진다",
            downloadState: .update,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .freeRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "1",
            subtitle: "금융이 쉬워진다",
            downloadState: .reinstall,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .freeRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "4",
            subtitle: "금융이 쉬워진다",
            downloadState: .installed,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .freeRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "5",
            subtitle: "금융이 쉬워진다",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .freeRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "6",
            subtitle: "금융이 쉬워진다",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .freeRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "7",
            subtitle: "금융이 쉬워진다",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
        .init(
            sectionType: .freeRanking,
            category: nil,
            title: "토스",
            description: nil,
            appIcon: "8",
            subtitle: "금융이 쉬워진다",
            downloadState: .install,
            price: nil,
            hasInAppPurchases: Bool.random(),
            backgroundColor: nil
        ),
    ]

    static func items(for section: FinanceSectionKind) -> [Item] {
        return items.filter { $0.sectionType == section }
    }
}
