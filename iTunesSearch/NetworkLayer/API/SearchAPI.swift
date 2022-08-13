//
//  SearchAPI.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation
import Moya

enum SearchAPI {
    case getSearchResultFromType(param: SearchAPIRequestModel)
}

extension SearchAPI: MTargetType {
    var path: String {
        switch self {
        case .getSearchResultFromType:
            return generateEndPoint(lastPath: "/search")
        }
    }
    
    var method: MoyaMethod {
        switch self {
        case .getSearchResultFromType:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getSearchResultFromType(let param):
            let encoding = URLEncoding(destination: .queryString, arrayEncoding: .noBrackets)
            return .requestParameters(parameters: param.dictionary()!, encoding: encoding)
        }
    }
    
    
}
