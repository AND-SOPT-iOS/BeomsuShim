//
//  ChartItemRow.swift
//  SixthSeminar
//
//  Created by RAFA on 11/29/24.
//

import SwiftUI

struct ChartItemRow: View {
    let item: Item

    var body: some View {
        HStack {
            Image(item.appIcon)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)

                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: {}) {
                Text(item.downloadState.buttonTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ChartItemRow(
        item: .init(
            appIcon: "0",
            title: "토스",
            subtitle: "금융이 쉬워진다",
            downloadState: .install
        )
    )
}
