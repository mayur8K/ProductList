//
//  ProductFavoriteList.swift
//  ProductCart
//
//  Created by Mayur Kamthe on 06/06/23.
//

import SwiftUI

struct ProductFavoriteList: View {
    @EnvironmentObject var model: ProductListViewModel
    let models: [ProductInfo]
    var body: some View {
        VStack {
            List(model.favouriteProducts, id: \.id) { product in
                NavigationLink(destination: ProductDetailView(model: product)) {
                    ProductRow(model: product)
                }
            }
        }
    }
}

