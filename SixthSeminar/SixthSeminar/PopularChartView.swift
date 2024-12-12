//
//  PopularChartView.swift
//  SixthSeminar
//
//  Created by RAFA on 11/29/24.
//

import SwiftUI

struct PopularChartView: View {

    let items = Item.mockItems

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.id) { item in
                    ChartItemRow(item: item)
                }
            }
            .navigationTitle("인기 차트")
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    PopularChartView()
}
