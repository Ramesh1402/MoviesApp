//
//  UIImageView.swift
//  MoviesApp
//
//  Created by Ramesh on 16/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView {

    func imageFromServerURL(_ URLString: String, placeHolder: UIImage?) {

        self.image = placeHolder

        if let url = URL(string: URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
                if error != nil {
                    print("err: \(error!.localizedDescription)")
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
