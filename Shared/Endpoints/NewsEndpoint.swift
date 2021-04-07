//
//  NewsEndpoint.swift
//  News
//
//  Created by benjamiin on 07/04/2021.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.nytimes.com/svc/topstories/v2?api-key=IDDIg4CA53fAug1Ap2dpKpUTAAVGl07b")!
        }
    }
    
    var path: String {
        return "/home.json"
    }
    
    var urlRequest: URLRequest {
        URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
}
