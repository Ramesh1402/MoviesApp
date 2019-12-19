//
//  Coordinator.swift
//  MoviesApp
//
//  Created by Ramesh on 14/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
