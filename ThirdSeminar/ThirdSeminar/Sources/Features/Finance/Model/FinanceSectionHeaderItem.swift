//
//  FinanceSectionHeaderItem.swift
//  ThirdSeminar
//
//  Created by RAFA on 10/30/24.
//

import Foundation

struct FinanceSectionHeaderItem {
    let title: String
    let rightArrowIcon: String
    let subtitle: String?
}

// MARK: - Mock Data

extension FinanceSectionHeaderItem {

    static var essentialHeader: FinanceSectionHeaderItem {
        return FinanceSectionHeaderItem(
            title: "필수 금융 앱",
            rightArrowIcon: "chevron.right",
            subtitle: "App Store 에디터가 직접 골랐습니다"
        )
    }

    static var paidRankingHeader: FinanceSectionHeaderItem {
        return FinanceSectionHeaderItem(
            title: "유료 순위",
            rightArrowIcon: "chevron.right",
            subtitle: nil
        )
    }

    static var freeRankingHeader: FinanceSectionHeaderItem {
        return FinanceSectionHeaderItem(
            title: "무료 순위",
            rightArrowIcon: "chevron.right",
            subtitle: nil
        )
    }
}
