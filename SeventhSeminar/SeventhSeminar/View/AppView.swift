//
//  AppView.swift
//  SeventhSeminar
//
//  Created by RAFA on 12/12/24.
//

import SwiftUI

struct AppView: View {

    let app: Application

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(Color.gray)
                .frame(width: 50, height: 50)

            VStack(alignment: .leading) {
                Text(app.title)
                    .bold()

                Text(app.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            VStack {
                ActionButton()
                    .padding(.bottom, 8)

                InAppPurchasesLabel()
            }
        }
    }
}

#Preview {
    AppView(app: .init(title: "토스", description: "금융이 쉬워진다"))
}
