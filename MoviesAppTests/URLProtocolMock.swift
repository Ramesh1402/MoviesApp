//
//  URLProtocolMock.swift
//  MoviesAppTests

//  Created by Ramesh on 15/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import Foundation

/// Mock implementation of URLProtocol to allow for injectable responses
class URLProtocolMock: URLProtocol {
    
    static var testResponses = [URL: (data: Data?, response: URLResponse?, error: Error?)]()
    
    static var lastTriedRequests: [URLRequest] = []
    
    
    override class func canInit(with request: URLRequest) -> Bool {
        
        lastTriedRequests.append(request)
        return true
    }
    
    // ignore this method; just send back what we were given
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        // if we have a valid URL…
        if let url = request.url {
            // …and if we have test data for that URL…
            if let response = URLProtocolMock.testResponses[url] {
                // …load it immediately.
                if let urlResponse = response.response {
                    self.client?.urlProtocol(self, didReceive: urlResponse, cacheStoragePolicy: .notAllowed)
                }
                if let data = response.data, response.error == nil {
                    self.client?.urlProtocol(self, didLoad: data)
                }
                if let error = response.error {
                    self.client?.urlProtocol(self, didFailWithError: error)
                }
                self.client?.urlProtocolDidFinishLoading(self)
            }
        }
        
        // mark that we've finished
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    // this method is required but doesn't need to do anything
    override func stopLoading() { }
}

extension URLRequest {
    func httpBodyCopy() -> Data? {
        return URLProtocol.property(forKey: "httpBody_copy", in: self) as? Data
    }
}
