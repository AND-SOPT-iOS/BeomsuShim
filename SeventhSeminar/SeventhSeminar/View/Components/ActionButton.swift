//
//  ActionButton.swift
//  SeventhSeminar
//
//  Created by RAFA on 12/12/24.
//

import SwiftUI

struct ActionButton: View {

    var title: String = "받기"

    var body: some View {
      Button(title) {}
        .font(Font.system(.caption).bold())
        .padding(.horizontal, 24)
        .padding(.vertical, 6)
        .background(Color(UIColor.systemGray6))
        .clipShape(Capsule())
    }
}

#Preview {
    ActionButton()
}
