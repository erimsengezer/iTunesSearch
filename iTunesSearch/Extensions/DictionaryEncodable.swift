//
//  DictionaryEncodable.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation

protocol DictionaryEncodable: Encodable {}

extension DictionaryEncodable {
    func dictionary() -> [String: Any]? {
        let encoder = JSONEncoder()

        guard let json = try? encoder.encode(self),
              let dict = try? JSONSerialization.jsonObject(with: json, options: []) as? [String: Any] else {
                return nil
        }
        
        return dict
    }
}
