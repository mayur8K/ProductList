//
//  LazyImage.swift
//  ProductCart
//
//  Created by Mayur Kamthe on 06/06/23.
//

import SwiftUI

struct LazyImage: View {
    static var defaultImage :UIImage = UIImage(named: "loader-icon")!
    @ObservedObject var imageDownloader: ImageDownloader
    
    init(imageUrl: String) {
        self.imageDownloader = ImageDownloader(imageUrl: imageUrl)
    }
    
    var body: some View {
        VStack {
            Image(uiImage: imageDownloader.downloadedImage ?? LazyImage.defaultImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
    }
}

struct LazyImage_Previews: PreviewProvider {
    static var previews: some View {
        LazyImage(imageUrl: "")
    }
}
