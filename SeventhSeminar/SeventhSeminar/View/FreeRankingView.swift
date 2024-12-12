//
//  FreeRankingView.swift
//  SeventhSeminar
//
//  Created by RAFA on 12/12/24.
//

import SwiftUI

struct FreeRankingView: View {

    @StateObject private var viewModel = RankingViewModel()

    var body: some View {
        VStack(spacing: 0) {
            SectionHeaderView(item: .freeRankingHeader)

            TabView {
                ForEach(viewModel.freeApps, id: \.title) { app in
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
    FreeRankingView()
}
