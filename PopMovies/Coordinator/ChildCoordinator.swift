//
//  ChildCoordinator.swift
//  PopMovies
//
//  Created by Raúl Pavón on 13/01/22.
//

import Foundation

protocol ChildCoordinator: Coordinator {
    func finish(completion: (() -> Void)?)
}
