//
//  Preview.swift
//  ThirdSeminar
//
//  Created by RAFA on 11/1/24.
//

import Foundation

struct Preview: Hashable {
    let id = UUID()
    let image: String
}

// MARK: - Mock Data

extension Preview {

    static let items: [Preview] = [
        .init(image: "tossImageView"),
        .init(image: "tossImageView"),
        .init(image: "tossImageView"),
        .init(image: "tossImageView"),
        .init(image: "tossImageView")
    ]
}
