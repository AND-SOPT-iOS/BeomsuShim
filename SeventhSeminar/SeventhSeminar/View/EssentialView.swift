//
//  EssentialView.swift
//  SeventhSeminar
//
//  Created by RAFA on 12/12/24.
//

import SwiftUI

struct EssentialView: View {

    @StateObject private var viewModel = EssentialViewModel()

    var body: some View {
        VStack(spacing: 0) {
            SectionHeaderView(item: .essentialHeader)

            TabView {
                ForEach(viewModel.apps, id: \.title) { app in
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
        .frame(width: UIScreen.main.bounds.width, height: 245)
    }
}

#Preview {
    EssentialView()
}
