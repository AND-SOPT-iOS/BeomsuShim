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

}
