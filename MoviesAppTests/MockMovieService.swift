//
//  MockMovieService.swift
//  MoviesAppTests

//  Created by Ramesh on 16/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import Foundation
@testable import MoviesApp

class MockMovieService: MoviesServiceable {
    var result: Result<[Movie], ServiceErrors>!
    
    func fetchMovies(completionHandler: @escaping (Result<[Movie], ServiceErrors>) -> Void) {
        completionHandler(result)
    }
    
}

