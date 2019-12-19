//
//  ViewController.swift
//  MoviesApp
//
//  Created by Ramesh on 14/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, Storyboarded {
    weak var coordinator: MovieCoordinator?
    var viewModel: MovieListViewable!
    let movieTableViewCellIdentifier = "movieCell"

    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        viewModel.gatherMovies()
    }

    func setUpView() {
        self.title = "Movies"
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: movieTableViewCellIdentifier, for: indexPath) as! MovieTableViewCell
        movieCell.updateUI(movie: self.viewModel.movies[indexPath.row])
        return movieCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showMovieDetail(movie: self.viewModel.movies[indexPath.row])
    }
    
}

extension MovieListViewController: MovieListProtocol {
    func loadMovies() {
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            let errorAlertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            errorAlertController.addAction(okAction)
            self.present(errorAlertController, animated: true, completion: nil)
        }
    }    
}

