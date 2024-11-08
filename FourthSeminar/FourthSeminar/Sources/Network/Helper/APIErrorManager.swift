//
//  APIErrorManager.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import Foundation

import Alamofire

final class APIErrorManager {

    static func parseError<T>(response: AFDataResponse<T>) -> NetworkError {
        guard let statusCode = response.response?.statusCode,
              let data = response.data
        else {
            return .unknownError
        }

        return handleStatusCode(statusCode, data: data)
    }

    private static func handleStatusCode(_ statusCode: Int, data: Data) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "00"): return .invalidRequest
        case (400, "01"): return .expressionError
        case (404, ""): return .invalidURL
        case (409, "00"): return .duplicateError
        case (500, ""): return .serverError
        default: return .unknownError
        }
    }

    private static func decodeError(data: Data) -> String {
        return (try? JSONDecoder().decode(ErrorResponseDTO.self, from: data))?.code ?? ""
    }
}
