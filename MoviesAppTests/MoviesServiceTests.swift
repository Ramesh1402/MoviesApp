//
//  MoviesServiceTests.swift
//  MoviesAppTests
//  Created by Ramesh on 16/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import XCTest
@testable import MoviesApp

class MoviesServiceTests: XCTestCase {
    var subject: MoviesService!
    
    override func setUp() {
        super.setUp()
        URLProtocol.registerClass(URLProtocolMock.self)

        subject = MoviesService()
    }
    
    func testfetchMoviesSuccess() {
        let expectation = XCTestExpectation(description: "MoviesServiceSuccess")
        let url = URL(string: "https://api.myjson.com/bins/18buhu")!
        let response = HTTPURLResponse(url: url,
                                       statusCode: 200,
                                       httpVersion: nil, headerFields: nil)
        let mockData = MockResponse.moviesServiceResponse.data(using: .utf8)!
        URLProtocolMock.testResponses[url] = (mockData,response,nil)
        
        let expectedResponse = try! JSONDecoder().decode(MoviesResponseModel.self, from: mockData)
        
        
        subject.fetchMovies { (result) in
            guard case let .success(value) = result else {
                XCTFail("Failed to make service call")
                return
            }
            
            XCTAssertEqual(value[0].title, expectedResponse.movies[0].title)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 100)
        
    }
    
    func testfetchMoviesFailure() {
        let expectation = XCTestExpectation(description: "MoviesServiceFailure")
        let url = URL(string: "https://api.myjson.com/bins/18buhu")!
        let response = HTTPURLResponse(url: url,
                                       statusCode: 200,
                                       httpVersion: nil, headerFields: nil)
        let mockData = MockResponse.moviesServiceResponseFailure.data(using: .utf8)!
        URLProtocolMock.testResponses[url] = (mockData,response,nil)
        
        
        subject.fetchMovies { (result) in
            guard case let .failure(value) = result else {
                XCTFail("Failed to make service call")
                return
            }
            
            XCTAssertEqual(value.userErrorMessage,"Error Occured")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 100)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        subject = nil
    }
}
