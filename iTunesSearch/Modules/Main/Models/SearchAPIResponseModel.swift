//
//  SearchAPIResponseModel.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation

struct SearchAPIResponseModel: Codable {
    let resultCount: Int?
    let results: [CollectionModel]
}

struct CollectionModel: Codable {
    let wrapperType: String?
    let kind: String?
    let artistId: Int?
    let collectionId, trackId: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewUrl: String?
    let collectionViewUrl, trackViewUrl: String?
    let previewUrl: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let collectionExplicitness, trackExplicitness: String?
    let discCount, discNumber: Int?
    let trackCount, trackNumber, trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let isStreamable: Bool?
    let collectionArtistId: Int?
    let collectionArtistViewUrl: String?
    let trackRentalPrice, collectionHdPrice, trackHdPrice, trackHdRentalPrice: Double?
    let contentAdvisoryRating, shortDescription, longDescription: String?
    let hasITunesExtras: Bool?
    let collectionArtistName: String?
}
