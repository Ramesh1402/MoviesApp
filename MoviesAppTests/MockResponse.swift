//
//  MockResponse.swift
//  MoviesAppTests
//  Created by Ramesh on 16/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import Foundation

enum MockResponse {
    static let moviesServiceResponse = "{\"movies\": [{\"Title\": \"Avengers\"}]}"
    static let moviesServiceResponseFailure = "{\"movvieswrong\": [{\"Title\": \"Avengers\"}]}"
}
