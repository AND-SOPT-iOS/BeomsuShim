//
//  EssentialViewModel.swift
//  SeventhSeminar
//
//  Created by RAFA on 12/12/24.
//

import Foundation

class EssentialViewModel: ObservableObject {

    @Published var apps: [Application] = []

    init() {
        loadApps()
    }

    private func loadApps() {
        apps = [
            Application(title: "App 1", description: "Description for Essential App 1"),
            Application(title: "App 2", description: "Description for Essential App 2"),
            Application(title: "App 3", description: "Description for Essential App 3")
        ]
    }
}
