//
//  Movie.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import Foundation

struct Movie: Codable {
    let title: String
    let releaseDate: String
    let overview: String
    let posterPath: String
    let raiting: Double
    let runTime: Int
    let trailers: Trailers
    
    init() {
        self.title = ""
        self.releaseDate = ""
        self.overview = ""
        self.raiting = 0.0
        self.runTime = 0
        self.posterPath = ""
        self.trailers = Trailers()
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case releaseDate = "release_date"
        case overview
        case raiting = "vote_average"
        case runTime = "runtime"
        case posterPath = "poster_path"
        case trailers = "videos"
    }
}

struct Trailers: Codable {
    let results: [Trailer]
    
    init() {
        self.results = []
    }
}

struct Trailer: Codable {
    let key: String
}
