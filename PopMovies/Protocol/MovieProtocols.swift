//
//  MovieProtocols.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import Foundation

protocol MovieView: AnyObject {
    func setMovie(movie: MovieList)
    func goToMovieDetail(movie: Movie)
}

protocol MovieViewModel {
    func getMovieList(option: String)
    func getMovieDetail(movieId: Int)
}
