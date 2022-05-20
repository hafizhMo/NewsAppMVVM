//
//  NewsItemView.swift
//  NewsAppMVVM
//
//  Created by Hafizh Mo on 20/05/22.
//

import SwiftUI
import URLImage

struct NewsItemView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            if let imgUrl =  article.image,
               let url = URL(string: imgUrl) {
                
                URLImage(url) {
                    
                } inProgress: { progress in
                    ProgressView()
                } failure: { error, retry in
                    ImageViewPlaceholder()
                } content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            } else {
                ImageViewPlaceholder()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N?A")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

struct ImageViewPlaceholder: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
