//
//  MovieDetailViewController.swift
//  MoviesApp
//
//  Created by Ramesh on 14/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController, Storyboarded {
    var viewModel: MovieDetailViewable!
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var ploatLael: UILabel!
    @IBOutlet weak var actorsLael: UILabel!
    @IBOutlet weak var actorViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var plotViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()

    }
    
    func setupUI() {
        self.title = viewModel.movie.title
        let moviePoster = viewModel.movie.poster ?? viewModel.movie.posterSecondary ?? ""
        self.posterImageView.imageFromServerURL(moviePoster, placeHolder: UIImage(named: "placeholder"))
        
        
        let actorsText = viewModel.movie.actors ?? "N/A"
        if actorsText.replacingOccurrences(of: " ", with: "") == "N/A" {
            actorViewHeightConstraint.constant = 0
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }
        else {
            self.actorsLael.text = actorsText
        }
        
        let plotText = viewModel.movie.plot ?? "N/A"
        if plotText.replacingOccurrences(of: " ", with: "") == "N/A" {            plotViewHeightConstraint.constant = 0
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        } else {
            self.ploatLael.text = plotText
        }
        
        
    }

  
}
