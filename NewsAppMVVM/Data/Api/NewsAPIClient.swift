//
//  NewsAPIClient.swift
//  NewsAppMVVM
//
//  Created by Hafizh Mo on 20/05/22.
//

import Foundation
import Combine

protocol NewsAPIClient {
    func request(from api: NewsAPIService) -> AnyPublisher<NewsResponse, NetworkHelper>
}

struct NewsAPIClientImpl: NewsAPIClient {
    func request(from api: NewsAPIService) -> AnyPublisher<NewsResponse, NetworkHelper> {
        
        return URLSession
            .shared
            .dataTaskPublisher(for: api.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in NetworkHelper.unknown }
            .flatMap { data, response -> AnyPublisher<NewsResponse, NetworkHelper> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: NetworkHelper.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data)
                        .decode(type: NewsResponse.self, decoder: jsonDecoder)
                        .mapError { _ in NetworkHelper.decodingError }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: NetworkHelper.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
}
