//
//  MoviesResponseModel.swift
//  MoviesApp
//
//  Created by Ramesh on 15/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import Foundation

struct MoviesResponseModel: Decodable {
    var movies: [Movie]
}

struct Movie: Decodable {
    var title: String?
    var rated: String?
    var released: String?
    var runTime: String?
    var genre: String?
    var director: String?
    var writer: String?
    var actors: String?
    var plot: String?
    var language: String?
    var country: String?
    var awards: String?
    var poster: String?
    var posterSecondary: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case rated = "Rated"
        case released = "Released"
        case runTime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster "
        case posterSecondary = "Poster"
    }
}



