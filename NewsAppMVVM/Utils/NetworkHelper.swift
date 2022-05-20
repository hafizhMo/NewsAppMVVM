//
//  NetworkHelper.swift
//  NewsAppMVVM
//
//  Created by Hafizh Mo on 20/05/22.
//

import Foundation

enum NetworkHelper: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension NetworkHelper: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode the object from services"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}
