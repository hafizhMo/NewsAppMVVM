//
//  HomeViewModel.swift
//  NewsAppMVVM
//
//  Created by Hafizh Mo on 20/05/22.
//

import Foundation
import Combine

protocol HomeViewModel {
    func getArticle()
}

class HomeViewModelImpl: ObservableObject, HomeViewModel {
    
    private let api: NewsAPIClient
    
    private(set) var articles = [Article]()
    private var cancellabels = Set<AnyCancellable>()
    
    @Published private(set) var state: NetworkState = .loading
    
    init(api: NewsAPIClient) {
        self.api = api
    }
    
    func getArticle() {
        
        self.state = .loading
        
        let cancellabel = api.request(from: .getNews)
            .sink { result in
                switch result {
                case .finished:
                    self.state = .success(content: self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
        
        self.cancellabels.insert(cancellabel)
    }
}
