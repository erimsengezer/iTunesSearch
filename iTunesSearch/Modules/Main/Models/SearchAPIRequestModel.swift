//
//  SearchAPIRequestModel.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation

enum MediaType: String, DictionaryEncodable {
    case movie
    case music
    case software
    case ebook
    case all
}

struct SearchAPIRequestModel: DictionaryEncodable {
    var term: String?
    var media: MediaType.RawValue?
    var limit: String?
}
