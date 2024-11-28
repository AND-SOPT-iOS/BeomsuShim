//
//  MyHobbyResponseDTO.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import Foundation

struct HobbyResult: Decodable {
    let hobby: String
}

struct MyHobbyResponseDTO: Decodable {
    let result: HobbyResult
}
