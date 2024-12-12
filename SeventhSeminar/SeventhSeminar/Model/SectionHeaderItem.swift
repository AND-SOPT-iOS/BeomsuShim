//
//  SectionHeaderItem.swift
//  SeventhSeminar
//
//  Created by RAFA on 12/12/24.
//

import Foundation

struct SectionHeaderItem: Identifiable {

    let id = UUID()
    let title: String
    let rightArrowIcon: String
    let subtitle: String?
}

extension SectionHeaderItem {

    static var essentialHeader: SectionHeaderItem {
        return SectionHeaderItem(
            title: "필수 금융 앱",
            rightArrowIcon: "chevron.right",
            subtitle: "App Store 에디터가 직접 골랐습니다"
        )
    }

    static var paidRankingHeader: SectionHeaderItem {
        return SectionHeaderItem(
            title: "유료 순위",
            rightArrowIcon: "chevron.right",
            subtitle: nil
        )
    }

    static var freeRankingHeader: SectionHeaderItem {
        return SectionHeaderItem(
            title: "무료 순위",
            rightArrowIcon: "chevron.right",
            subtitle: nil
        )
    }
}
