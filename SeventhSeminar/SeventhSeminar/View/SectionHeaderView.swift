//
//  SectionHeaderView.swift
//  SeventhSeminar
//
//  Created by RAFA on 12/12/24.
//

import SwiftUI

struct SectionHeaderView: View {

    let item: SectionHeaderItem

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(item.title)
                    .font(.headline)

                Spacer()

                Image(systemName: item.rightArrowIcon)
                    .foregroundColor(.gray)
            }

            if let subtitle = item.subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

#Preview {
    SectionHeaderView(
        item: .init(
            title: "필수 금융 앱",
            rightArrowIcon: "chevron.right",
            subtitle: "App Store 에디터가 직접 골랐습니다"
        )
    )
}
