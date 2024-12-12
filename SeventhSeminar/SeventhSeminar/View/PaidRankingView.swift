//
//  PaidRankingView.swift
//  SeventhSeminar
//
//  Created by RAFA on 12/12/24.
//

import SwiftUI

struct PaidRankingView: View {

    @StateObject private var viewModel = RankingViewModel()

    var body: some View {
        VStack(spacing: 0) {
            SectionHeaderView(item: .paidRankingHeader)

            TabView {
                ForEach(viewModel.paidApps, id: \.title) { app in
                    VStack {
                        AppView(app: app)
                        AppView(app: app)
                        AppView(app: app)
                    }
                }
                .padding(.horizontal)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .tabViewStyle(PageTabViewStyle())
        }
        .frame(width: UIScreen.main.bounds.width, height: 250)
    }
}

#Preview {
    PaidRankingView()
}
