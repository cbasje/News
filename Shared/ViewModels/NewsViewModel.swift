//
//  NewsViewModel.swift
//  News
//
//  Created by benjamiin on 07/04/2021.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
    var isLoading: Bool { get }
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    private let service: NewsService
    
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    var selectedArticle: Article?
    
    @Published private(set) var state: ResultState = .loading
    
    var isLoading: Bool {
        state == .loading
    }
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                case .finished:
                    self.state = .success(content: self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.articles = response.results
            }

        self.cancellables.insert(cancellable)
    }
}
