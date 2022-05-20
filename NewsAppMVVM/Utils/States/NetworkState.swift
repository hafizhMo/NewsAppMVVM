//
//  NetworkState.swift
//  NewsAppMVVM
//
//  Created by Hafizh Mo on 20/05/22.
//

import Foundation

enum NetworkState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
