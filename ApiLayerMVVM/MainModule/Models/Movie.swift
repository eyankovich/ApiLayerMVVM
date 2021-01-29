//
//  ViewData.swift
//  ApiLayerMVVM
//
//  Created by Егор Янкович on 1/27/21.
//

import Foundation

struct Movie: Codable {
    let adult: Bool?
    let backdropPath: String?
    let belongsToCollection: String?
    let budget: Int?
    let genres: [Genres]?
    let homepage: String?
    let id: Int?
    let imdbId: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [Companies]?
    let productioncountries: [Countries]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [Languages]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
}

struct Genres: Codable {
    let id: Int?
    let name: String?
}

struct Companies: Codable {
    let id: Int?
    let logoPath: String?
    let name: String?
    let originCountry: String?
}

struct Countries: Codable {
    let iso31661: String?
    let name: String?
}

struct Languages: Codable {
    let englishName: String?
    let iso31661: String?
    let name: String?
}

