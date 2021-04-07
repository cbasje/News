//
//  ResultState.swift
//  News
//
//  Created by benjamiin on 07/04/2021.
//

import Foundation

enum ResultState: Equatable {
    static func == (lhs: ResultState, rhs: ResultState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.failed(let errLhs), .failed(let errRhs)):
            return errLhs.localizedDescription == errRhs.localizedDescription
        case (.success(let contLhs), .success(let contRhs)):
            return contLhs == contRhs
        default:
            return false
        }
    }
    
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
