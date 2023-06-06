//
//  ProductDetailView.swift
//  ProductCart
//
//  Created by Mayur Kamthe on 06/06/23.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var viewmodel: ProductListViewModel
    let model: ProductInfo
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: model.imageURL)).frame(width: 350, height: 300)
            Divider()
            HStack {
                Text(model.title)
                    .font(.title)
                Divider().frame(height: 70)
                Text("\(model.saleUnitPrice, specifier: "%.2f")$")
                    .font(.title)
                Divider().frame(height: 70)
                Text("\(model.ratingCount, specifier: "%.2f")")
                Image("star").resizable().frame(width: 30, height: 30)
            }
            Divider()
            HStack {
                Button {
                } label: {
                    Image("addToCart").resizable()
                        .frame(width: 30, height: 30)
                }
                Button {
                    viewmodel.markProductFavourite(model: model)
                } label: {
                    let isFavourite = viewmodel.favouriteProducts.contains(where: { $0.id == model.id })
                    if !isFavourite {
                        Image("heartLine").resizable()
                            .frame(width: 30, height: 30)
                    } else {
                        Image("heart").resizable()
                            .frame(width: 30, height: 30)
                    }
                }
            }
        }
    }
}


