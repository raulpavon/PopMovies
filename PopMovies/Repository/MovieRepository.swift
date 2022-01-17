//
//  MovieRepository.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import Foundation
import UIKit

class MovieRepository {
    
    enum MovieRepositoryURL {
        static let theMovieDatabaseURL = "https://api.themoviedb.org/3/movie/"
        static let topRated = "top_rated"
        static let popular = "popular"
        static let trailer = "&append_to_response=videos"
    }
    
    enum HttpMethod {
        static let get = "GET"
    }
    
    func getMovies(option: String, _ completionHandler: @escaping (MovieList) -> Void) {
        if let requestURL = URL(string: option == MovieListViewController.OrderOptions.One.rawValue ? "\(MovieRepositoryURL.theMovieDatabaseURL)\(MovieRepositoryURL.topRated)?api_key=\(GlobalConstants.TheMovieDatabase.apiKey)\(NSLocalizedString(GlobalConstants.Localize.urlLanguage, comment: ""))" : "\(MovieRepositoryURL.theMovieDatabaseURL)\(MovieRepositoryURL.popular)?api_key=\(GlobalConstants.TheMovieDatabase.apiKey)\(NSLocalizedString(GlobalConstants.Localize.urlLanguage, comment: ""))") {
            var request = URLRequest(url: requestURL)
            request.httpMethod = HttpMethod.get
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    print("Error fetching movies: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let response = try JSONDecoder().decode(MovieList.self, from: data)
                    completionHandler(response)
                } catch {
                    print("Error decoding movies: \(error)")
                    return
                }
            }.resume()
        }
    }
    
    func getMovieDetail(movieId: Int, _ completionHandler: @escaping (Movie) -> Void) {
        if let requestURL = URL(string: "\(MovieRepositoryURL.theMovieDatabaseURL)\(movieId)?api_key=\(GlobalConstants.TheMovieDatabase.apiKey)\(MovieRepositoryURL.trailer)\(NSLocalizedString(GlobalConstants.Localize.urlLanguage, comment: ""))") {
            var request = URLRequest(url: requestURL)
            request.httpMethod = HttpMethod.get
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    print("Error fetching movies: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let response = try JSONDecoder().decode(Movie.self, from: data)
                    completionHandler(response)
                } catch {
                    print("Error decoding movies: \(error)")
                    return
                }
            }.resume()
        }
    }
}
