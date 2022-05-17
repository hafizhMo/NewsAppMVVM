//
//  NewsAPI.swift
//  NewsAppMVVM
//
//  Created by Hafizh Mo on 17/05/22.
//

import Foundation

protocol APIBuilder {
    var baseUrl: URL { get }
    var path: String { get }
    var urlRequest: URLRequest { get }
}

enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
}
