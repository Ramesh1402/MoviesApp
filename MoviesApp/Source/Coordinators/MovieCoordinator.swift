//
//  MovieCoordinator.swift
//  MoviesApp
//
//  Created by Ramesh on 14/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import Foundation
import UIKit

class MovieCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let movieListViewController = MovieListViewController.instantiate()
        movieListViewController.coordinator = self
        
        let movieListViewModel = MovieListViewModel()
        movieListViewModel.moviesDelegate = movieListViewController
        
        movieListViewController.viewModel = movieListViewModel
        self.navigationController.pushViewController(movieListViewController, animated: true)
    }
    
    func showMovieDetail(movie: Movie) {
        let movieDetailViewController = MovieDetailViewController.instantiate()
        let movieDetailViewModel = MovieDetailViewModel(movie: movie)
        movieDetailViewController.viewModel = movieDetailViewModel
        self.navigationController.pushViewController(movieDetailViewController, animated: true)
    }
}
