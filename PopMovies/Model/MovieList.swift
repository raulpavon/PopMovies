//
//  MovieList.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import Foundation

struct MovieList: Codable {
    let results: [Results]
    
    init() {
        self.results = []
    }
}

struct Results: Codable {
    let posterPath: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case id
    }
}
