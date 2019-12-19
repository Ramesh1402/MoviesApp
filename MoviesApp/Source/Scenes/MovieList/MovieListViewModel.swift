//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Ramesh on 15/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import Foundation

protocol MovieListViewable {
    func gatherMovies()
    var movies: [Movie] { get set }
}

protocol MovieListProtocol: class {
    func loadMovies()
    func showError(message: String)
}

class MovieListViewModel: MovieListViewable {
    private let moviesService: MoviesServiceable
    weak var  moviesDelegate: MovieListProtocol?
    var movies = [Movie]()
    
    init(moviesService: MoviesServiceable) {
        self.moviesService = moviesService
    }
    
    convenience init() {
        self.init(moviesService: MoviesService())
    }
   
    func gatherMovies() {
        moviesService.fetchMovies {[unowned self] (result) in
            switch result {
            case .success(let movies):
                self.movies = movies
                self.moviesDelegate?.loadMovies()
            case .failure(let error):
                self.moviesDelegate?.showError(message: error.userErrorMessage)
                print(error)
            }
        }
    }
}
