//
//  ContentView.swift
//  SeventhSeminar
//
//  Created by RAFA on 12/12/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            List {
                FeaturedView()
                    .listRowSeparator(.hidden)
                EssentialView()
                    .listRowSeparator(.hidden)
                PaidRankingView()
                    .listRowSeparator(.hidden)
                FreeRankingView()
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("금융")
        }
    }
}

#Preview {
    ContentView()
}
