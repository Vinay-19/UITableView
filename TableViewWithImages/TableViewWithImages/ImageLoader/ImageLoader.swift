//
//  ImageLoader.swift
//  TableViewWithImages
//
//  Created by Vinay Kumar Thapa on 2022-12-02.
//

import Foundation
import UIKit


class ImageLoader {
    
    var downloadedData: UIImage?
   
    
    func downloadImage(url: String) -> UIImage {
        
        guard let imageURL = URL(string: url) else {
            return UIImage()
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = UIImage(data: data)
            }
            
        }.resume()
        
        return self.downloadedData ?? UIImage()
    }
    
}
