//
//  NewsResponse.swift
//  NewsAppMVVM
//
//  Created by Hafizh Mo on 17/05/22.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: Article {
        .init(author: "Ririka",
              url: "https://www.wgal.com/article/avian-flu-update-berks-county/40051042",
              source: "WGAL Susquehanna Valley Pa.",
              title: "Avian flu update in Berks County - WGAL Susquehanna Valley Pa.",
              articleDescription: "The flu has impacted 15 flocks in the state of Pennsylvania",
              image: "https://inliving.jp/wp-content/uploads/2022/05/hp_gallery_002.jpg",
              date: Date())
    }
}
