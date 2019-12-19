//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Ramesh on 16/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import Foundation

protocol MovieDetailViewable {
    var movie: Movie { get set }
}

class MovieDetailViewModel: MovieDetailViewable {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
