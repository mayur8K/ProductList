//
//  ProductList.swift
//  ProductCart
//
//  Created by Mayur Kamthe on 06/06/23.
//

import SwiftUI

struct ProductList: View {
    @EnvironmentObject var viewmodel: ProductListViewModel

    var body: some View {
        NavigationView {
            TabView {
                ProductItemsView(models: viewmodel.products)
                    .onAppear {
                        viewmodel.getProductList()
                    }
                    .tabItem {
                        Text("Products")
                    }
                ProductFavoriteList(models: viewmodel.favouriteProducts)
                    .tabItem {
                        Text("Favourites")
                    }
            }
            .navigationTitle("Products")
        }
    }
}

struct ProductItemsView: View {
    let models: [ProductInfo]
    var body: some View {
        VStack {
            List(models, id: \.id) { product in
                NavigationLink(destination: ProductDetailView(model: product)) {
                    ProductRow(model: product)
                }
            }
        }
    }
}

struct ProductRow: View {
    let model: ProductInfo
    @EnvironmentObject var viewmodel: ProductListViewModel
    var body: some View {
        HStack {
            LazyImage(imageUrl: model.imageURL)
            VStack {
                HStack {
                    Text(model.title)
                }
                HStack {
                    Text("\(model.saleUnitPrice, specifier: "%.1f")$")
                    Spacer()
                    Button {
                    } label: {
                        Image("addToCart").resizable()
                            .frame(width: 30, height: 30)
                    }
                    Button(action: {
                    }, label: {
                        let isFavourite = viewmodel.favouriteProducts.contains(where: { $0.id == model.id })
                        if !isFavourite {
                            Image("heartLine").resizable()
                                .frame(width: 30, height: 30)
                        } else {
                            Image("heart").resizable()
                                .frame(width: 30, height: 30)
                        }
                    }).onTapGesture {
                        viewmodel.markProductFavourite(model: model)
                    }
                }
            }
        }
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        let model: [ProductInfo] = [
            ProductInfo(citrusID: "123", title: "1" ,id: "123", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", isAddToCartEnable: false, saleUnitPrice: 5.8, ratingCount: 5.0)
        ]
        ProductItemsView(models: model)
    }
}

