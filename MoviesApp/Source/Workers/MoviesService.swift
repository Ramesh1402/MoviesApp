//
//  MoviesService.swift
//  MoviesApp
//
//  Created by Ramesh on 15/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import Foundation

protocol MoviesServiceable {
    func fetchMovies(completionHandler: @escaping (Result<[Movie], ServiceErrors>) -> Void)
}

class MoviesService: MoviesServiceable {
    let moviesSourceUrl = "https://api.myjson.com/bins/18buhu"
    
    func fetchMovies(completionHandler: @escaping (Result<[Movie], ServiceErrors>) -> Void) {
        guard let moviesUrl = URL(string: moviesSourceUrl) else {
            completionHandler(Result.failure(.serviceError))
            return
        }
        
        URLSession.shared.dataTask(with: moviesUrl) { (data, response, error) in
            if error != nil {
                completionHandler(Result.failure(.serviceUnavailable(error: error)))
                return
            }
            do {
                let moviesResponse = try JSONDecoder().decode(MoviesResponseModel.self, from: data!)
                completionHandler(Result.success(moviesResponse.movies))
            }
            catch let error {
                completionHandler(Result.failure(.parseError(error: error)))
            }
        }.resume()
    }
}
