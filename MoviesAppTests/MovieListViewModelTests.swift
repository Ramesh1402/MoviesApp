//
//  MovieListViewModelTests.swift
//  MoviesAppTests
//
//  Copyright © 2019 Ramesh. All rights reserved.
//

import XCTest
@testable import MoviesApp

class MovieListViewModelTests: XCTestCase {
    var subject: MovieListViewModel!
    var mockMovieService: MockMovieService!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockMovieService = MockMovieService()
        subject = MovieListViewModel(moviesService: mockMovieService)
    }
    
    func testgatherMoviesSuccess() {
        let mockMovie = Movie(title: "TestMovie",
                              rated: nil,
                              released: nil,
                              runTime: nil,
                              genre: nil,
                              director: nil,
                              writer: nil,
                              actors: nil,
                              plot: nil,
                              language: nil,
                              country: nil,
                              awards: nil,
                              poster: nil,
                              posterSecondary: nil)
        
        mockMovieService.result = Result.success([mockMovie])
        XCTAssertEqual(subject.movies.count, 0)
        subject.gatherMovies()
        XCTAssertEqual(subject.movies.count, 1)

    }
    
    func testgatherMoviesFailure() {
        
        mockMovieService.result = Result.failure(.netWorkError)
        subject.gatherMovies()
        XCTAssertEqual(subject.movies.count, 0)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        subject = nil
        mockMovieService = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
