//
//  MovieViewModel.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import Foundation
import UIKit

class MovieViewModelImp: MovieViewModel {

    weak var view: MovieView?
    let movieRepository: MovieRepository
    private var movies = MovieList()
    private var movie = Movie()
    
    
    required init(view: MovieView?, movieRepository: MovieRepository) {
        self.view = view
        self.movieRepository = movieRepository
    }
    
    func getMovieList(option: String) {
        movieRepository.getMovies(option: option) {
            [weak self] response in
            self?.movies = response
            self?.view?.setMovie(movie: self?.movies ?? MovieList())
        }
    }
    
    func getMovieDetail(movieId: Int) {
        movieRepository.getMovieDetail(movieId: movieId) {
            [weak self] response in
            self?.movie = response
            self?.view?.goToMovieDetail(movie: self?.movie ?? Movie())
        }
    }
}
