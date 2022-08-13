//
//  Definitions.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation
import Moya


// MARK: - Provider
func createMoyaProvider<Target: TargetType>(targetType: Target.Type) -> MoyaProvider<Target> {
    let provider = MoyaProvider<Target>()
    provider.session.sessionConfiguration.timeoutIntervalForRequest = 120
    return provider
}

// MARK: - Request Parameters
typealias MoyaMethod = Moya.Method
typealias MoyaTask = Task

// MARK: - TargetType - Header
public protocol MTargetType: TargetType {}

extension MTargetType {
    var baseURL: URL {
        return URL(string: NetworkUtil.environmentBaseURL)!
    }
    
    public var headers: [String: String]? {
        let headers: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
        ]
        return headers
    }

    func generateEndPoint(lastPath: String) -> String {
        return NetworkUtil.generateMobileEndPointV1(lastPath: lastPath)
    }
}
