//
//  ArticleView.swift
//  News
//
//  Created by benjamiin on 07/04/2021.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    @State var isLoading: Bool
    
    let article: Article
    
    var errorImage: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
    
    var body: some View {
        HStack {
            if let multimedia = article.multimedia.first,
               let imgURL = multimedia.url,
               let url = URL(string: imgURL) {
                
                URLImage(url: url,
                         options: URLImageOptions(identifier: article.id.uuidString, cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25)
                         ),
                         failure: { error, _ in
                            errorImage
                         },
                         content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        })
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
            } else {
                errorImage
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .lineLimit(2)
                
                Text(article.byline ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .lineLimit(1)
                
                if let date = article.publishedDate {
                    HStack {
                        Text("\(date, style: .date)")
                        Text("\(date, style: .time)")
                    }
                    .foregroundColor(.gray)
                    .font(.footnote)
                }
            }
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .allowsHitTesting(!isLoading)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(isLoading: false, article: Article.dummydata.first!)
    }
}
