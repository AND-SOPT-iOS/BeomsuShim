//
//  LoginResponseDTO.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import Foundation

struct LoginToken: Decodable {
    let token: String
}

struct LoginResponseDTO: Decodable {
    let result: LoginToken
}
