//
//  RankingViewModel.swift
//  SeventhSeminar
//
//  Created by RAFA on 12/12/24.
//

import Foundation

class RankingViewModel: ObservableObject {

    @Published var paidApps: [Application] = []
    @Published var freeApps: [Application] = []

    init() {
        loadPaidApps()
        loadFreeApps()
    }

    private func loadPaidApps() {
        paidApps = [
            Application(title: "Paid App 1", description: "Description for Paid App 1"),
            Application(title: "Paid App 2", description: "Description for Paid App 2"),
            Application(title: "Paid App 3", description: "Description for Paid App 3")
        ]
    }

    private func loadFreeApps() {
        freeApps = [
            Application(title: "Free App 1", description: "Description for Free App 1"),
            Application(title: "Free App 2", description: "Description for Free App 2"),
            Application(title: "Free App 3", description: "Description for Free App 3")
        ]
    }
}
