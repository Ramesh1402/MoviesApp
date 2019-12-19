//
//  MovieTableViewCell.swift
//  MoviesApp
//
//  Created by Ramesh on 16/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(movie: Movie) {
        let moviePoster = movie.poster ?? movie.posterSecondary ?? ""
        self.movieImageView.imageFromServerURL(moviePoster, placeHolder: UIImage(named: "placeholder"))
        self.movieTitleLabel.text = movie.title ?? "Unknown"
        self.genreLabel.text = movie.genre ?? "Unknown"
    }

}
