//
//  Review.swift
//  ThirdSeminar
//
//  Created by RAFA on 11/1/24.
//

import Foundation

struct Review: Hashable {
    let id = UUID()
    let title: String
    let date: String
    let nickname: String
    let content: String
}

// MARK: - Mock Data

extension Review {

    static let items: [Review] = [
        .init(
            title: "과제 너무 빡센거 아니에요?",
            date: "11월 1일",
            nickname: "심범",
            content: "사과해요 나한테"
        ),
        .init(
            title: "가나다라마바사",
            date: "10월 31일",
            nickname: "아자",
            content: "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세"
        ),
        .init(
            title: "앤솝 iOS YB 35기",
            date: "10월 27일",
            nickname: "INTJ",
            content: """
            동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한 사람 대한으로 길이 보전하세
            """
        ),
        .init(
            title: "집 가서 뭐하지",
            date: "10월 25일",
            nickname: "아리",
            content: "자고 싶다"
        ),
        .init(
            title: "군사법원의 조직·권한 및 재판관의 자격은 법률로 정한다.",
            date: "10월 21일",
            nickname: "근로조건",
            content: """
            대통령이 궐위된 때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다. 국회는 헌법 또는 법률에 특별한 규정이 없는 한 재적의원 과반수의 출석과 출석의원 과반수의 찬성으로 의결한다. 가부동수인 때에는 부결된 것으로 본다.
            """
        ),
    ]
}
