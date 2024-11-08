//
//  Environment.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import Foundation

struct Environment {

    static var baseURL: String {
        guard let baseURL = ProcessInfo.processInfo.environment["BASE_URL"],
              !baseURL.isEmpty
        else {
            fatalError("BASE_URL을 찾을 수 없습니다.")
        }

        return baseURL
    }
}
