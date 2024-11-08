//
//  AuthService.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import Foundation

import Alamofire

final class AuthService {

    private static let baseURL = Environment.baseURL

    static func register(
        username: String,
        password: String,
        hobby: String,
        completion: @escaping (Result<Int, NetworkError>) -> Void
    ) {
        let url = "\(baseURL)/user"
        let parameters = RegisterRequestDTO(
            username: username,
            password: password,
            hobby: hobby
        )

        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .responseDecodable(of: RegisterResponseDTO.self) { response in
            switch response.result {
            case .success(let success):
                let userId = success.result.no
                completion(.success(userId))
            case .failure:
                completion(.failure(APIErrorManager.parseError(response: response)))
            }
        }
    }

    static func login(
        username: String,
        password: String,
        completion: @escaping (Result<String, NetworkError>) -> Void
    ) {
        let url = "\(baseURL)/login"
        let parameters = LoginRequestDTO(username: username, password: password)

        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .responseDecodable(of: LoginResponseDTO.self) { response in
            switch response.result {
            case .success(let success):
                let token = success.result.token
                UserDefaults.standard.set(token, forKey: UserDefaults.authToken)
                print("DEBUG: 저장된 토큰 - \(token)")
                completion(.success(token))
            case .failure:
                completion(.failure(APIErrorManager.parseError(response: response)))
            }
        }
    }
}
