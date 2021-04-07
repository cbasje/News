//
//  ErrorView.swift
//  News
//
//  Created by benjamiin on 07/04/2021.
//

import SwiftUI

struct ErrorView: View {
    typealias ErrorViewActionHandler = () -> Void
    
    let error: Error
    let handler: ErrorViewActionHandler
    
    internal init(error: Error, handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 48, weight: .heavy))
            
            Text("Oops")
                .foregroundColor(.black)
                .font(.system(size: 24, weight: .heavy))
            
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
            
            Button(action: handler) {
                Text("Retry")
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .heavy))
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.top)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {
            print("hello")
        }
        .previewLayout(.sizeThatFits)
    }
}
