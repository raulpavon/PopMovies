//
//  MovieCoordinator.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import Foundation
import UIKit

class MovieCoordinator {
    
    var navigationController: UINavigationController
    private let factory =  MovieFactoryImp()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let movieListViewController = factory.makeMovieListViewController(movieCoordinator: self)
        navigationController.setViewControllers([movieListViewController], animated: false)
    }
    
    func openMovieDetail(movie: Movie) {
        let movieDetailViewController = factory.makeMovieDeatailViewController(movieCoordinator: self, movie: movie)
        navigationController.pushViewController(movieDetailViewController, animated: true)
    }
}
