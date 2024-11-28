//
//  RegisterResponseDTO.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import Foundation

struct RegistrationNumber: Decodable {
    let no: Int
}

struct RegisterResponseDTO: Decodable {
    let result: RegistrationNumber
}
