//
//  ImageDownloader.swift
//  ProductCart
//
//  Created by Mayur Kamthe on 06/06/23.
//

import Foundation
import UIKit

extension UIImage {
    func resizeImage(with size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))

        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

class ImageDownloader: ObservableObject {
    @Published var downloadedImage: UIImage?
    private let imagePath: URL
    
    public init(imageUrl: String) {
        self.imagePath = URL(string: imageUrl)!
        getImage()
    }
    
    func getImage() {
        let urlRequest = URLRequest(url: self.imagePath)
        URLSession.shared.dataTask(with: urlRequest) { [weak self] imageData, response, error in
            if(error == nil && imageData != nil){
                DispatchQueue.main.async {
                    guard let data = imageData else {return}
                    let resizedImage = UIImage(data: data)?.resizeImage(with: CGSize(width: 100, height: 100))
                    self?.downloadedImage = resizedImage
                }
            }
        }.resume()
    }
}



