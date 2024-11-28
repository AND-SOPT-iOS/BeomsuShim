//
//  UserService.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import Foundation

import Alamofire

final class UserService {

    private static let baseURL = Environment.baseURL

    static func fetchUserHobby(
        token: String,
        completion: @escaping (Result<String, NetworkError>) -> Void
    ) {
        let url = "\(baseURL)/user/my-hobby"

        AF.request(
            url,
            method: .get,
            headers: ["token": token]
        )
        .validate()
        .responseDecodable(of: MyHobbyResponseDTO.self) { response in
            switch response.result {
            case .success(let success):
                let hobby = success.result.hobby
                completion(.success(hobby))
            case .failure:
                completion(.failure(APIErrorManager.parseError(response: response)))
            }
        }
    }

    static func fetchUserHobbyById(
        userId: Int,
        token: String,
        completion: @escaping (Result<String, NetworkError>) -> Void
    ) {
        let url = "\(baseURL)/user/\(userId)/hobby"

        AF.request(
            url,
            method: .get,
            headers: ["token": token]
        )
        .validate()
        .responseDecodable(of: MyHobbyResponseDTO.self) { response in
            switch response.result {
            case .success(let success):
                let hobby = success.result.hobby
                completion(.success(hobby))
            case .failure:
                completion(.failure(APIErrorManager.parseError(response: response)))
            }
        }
    }

    static func updateUserInfo(
        hobby: String,
        password: String,
        token: String,
        completion: @escaping (Result<Void, NetworkError>) -> Void
    ) {
        let url = "\(baseURL)/user"
        let parameters: [String: Any] = ["hobby": hobby, "password": password]
        let headers: HTTPHeaders = ["token": token]

        AF.request(
            url,
            method: .put,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: headers
        )
        .validate()
        .response { response in
            switch response.result {
            case .success:
                completion(.success(()))
            case .failure:
                completion(.failure(APIErrorManager.parseError(response: response)))
            }
        }
    }
}
