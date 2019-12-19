//
//  StoryBoarded.swift
//  MoviesApp
//
//  Created by Ramesh on 14/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let storyBoardIdentifier = String(describing: self)
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyBoard.instantiateViewController(withIdentifier: storyBoardIdentifier) as! Self
    }
}
