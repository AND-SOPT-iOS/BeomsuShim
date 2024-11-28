//
//  FinanceItem.swift
//  SixthSeminar
//
//  Created by RAFA on 11/29/24.
//

import Foundation

enum DownloadState {
    case installed
    case install
    case update

    var buttonTitle: String {
        switch self {
        case .installed: return "열기"
        case .install: return "받기"
        case .update: return "업데이트"
        }
    }
}

struct Item: Hashable {
    let id = UUID()
    let appIcon: String
    let title: String
    let subtitle: String
    let downloadState: DownloadState
}

extension Item {

    static let mockItems: [Item] = [
        Item(
            appIcon: "0",
            title: "앱 1",
            subtitle: "첫 번째 앱",
            downloadState: .install
        ),
        Item(
            appIcon: "1",
            title: "앱 2",
            subtitle: "두 번째 앱",
            downloadState: .installed
        ),
        Item(
            appIcon: "2",
            title: "앱 3",
            subtitle: "세 번째 앱",
            downloadState: .installed
        ),
        Item(
            appIcon: "3",
            title: "앱 4",
            subtitle: "네 번째 앱",
            downloadState: .install
        ),
        Item(
            appIcon: "4",
            title: "앱 5",
            subtitle: "다섯 번째 앱",
            downloadState: .update
        ),
        Item(
            appIcon: "5",
            title: "앱 6",
            subtitle: "여섯 번째 앱",
            downloadState: .installed
        ),
        Item(
            appIcon: "6",
            title: "앱 7",
            subtitle: "일곱 번째 앱",
            downloadState: .update
        ),
        Item(
            appIcon: "7",
            title: "앱 8",
            subtitle: "여덟 번째 앱",
            downloadState: .installed
        ),
        Item(
            appIcon: "8",
            title: "앱 9",
            subtitle: "아홉 번째 앱",
            downloadState: .install
        ),
        Item(
            appIcon: "9",
            title: "앱 10",
            subtitle: "열 번째 앱",
            downloadState: .install
        ),
        Item(
            appIcon: "10",
            title: "앱 11",
            subtitle: "열한 번째 앱",
            downloadState: .installed
        ),
        Item(
            appIcon: "11",
            title: "앱 12",
            subtitle: "열두 번째 앱",
            downloadState: .installed
        )
    ]
}
