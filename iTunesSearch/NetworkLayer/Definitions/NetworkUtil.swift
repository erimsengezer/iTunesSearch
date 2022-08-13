//
//  NetworkUtil.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation

enum APIEnvironment {
    case dev
    case production
}

struct NetworkUtil {
    private static let environment: APIEnvironment = .dev
    
    static var environmentBaseURL: String {
        switch NetworkUtil.environment {
        case .production: return "https://itunes.apple.com"
        case .dev: return "https://itunes.apple.com"
        }
    }
    
    static func generateMobileEndPointV1(lastPath: String) -> String {
        return "\(lastPath)"
    }
}
