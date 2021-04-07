//
//  FeedView.swift
//  News
//
//  Created by benjamiin on 07/04/2021.
//

import SwiftUI
import Combine

struct FeedView: View {
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    @State private var showSafariView = false
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .failed(let error):
                    ErrorView(error: error,
                              handler: viewModel.getArticles)
                default:
                    List(viewModel.isLoading ? Article.dummydata : viewModel.articles) { article in
                        ArticleView(isLoading: viewModel.isLoading,
                                    article: article)
                            .onTapGesture {
                                viewModel.selectedArticle = article
                                showSafariView = true
                            }
                    }
                    .navigationTitle("News")
                }
            }
        }
        .onAppear(perform: viewModel.getArticles)
        .sheet(isPresented: $showSafariView) {
            if let stringUrl = viewModel.selectedArticle?.url,
               let url = URL(string: stringUrl) {
                SFSafariView(url: url, color: .orange)
                    .ignoresSafeArea()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
