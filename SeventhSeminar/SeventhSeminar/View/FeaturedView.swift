//
//  FeaturedView.swift
//  SeventhSeminar
//
//  Created by RAFA on 12/12/24.
//

import SwiftUI

struct FeaturedView: View {

    var body: some View {
        TabView {
            ForEach(0..<5) { item in
                VStack {
                    VStack(alignment: .leading) {
                        Text("UPDATE")
                            .bold()
                            .foregroundColor(.blue)
                            .font(.footnote)

                        Text("App title")
                            .font(.title3)

                        Text("Description")
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .foregroundColor(Color.gray)
                }
            }
            .padding(.horizontal)
        }
        .frame(width: UIScreen.main.bounds.width, height: 300)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .padding(.bottom, 24)
    }
}

#Preview {
    FeaturedView()
}
