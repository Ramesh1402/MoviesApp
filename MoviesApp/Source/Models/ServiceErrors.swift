//
//  ServiceErrors.swift
//  MoviesApp
//
//  Created by Ramesh on 15/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import Foundation

enum ServiceErrors: Error {
    case netWorkError
    case serviceError
    case serviceUnavailable(error: Error?)
    case parseError(error: Error?)
    
    var userErrorMessage: String {
        switch self {
        case .netWorkError:
            return "Network Error"
        case .parseError:
            return "Error Occured"
        case .serviceUnavailable:
            return "Service Unavailable"
        case .serviceError:
            return "Service Error"
            
        }
    }
}
