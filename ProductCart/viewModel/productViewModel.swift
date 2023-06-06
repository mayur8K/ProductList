//
//  productViewModel.swift
//  ProductCart
//
//  Created by Mayur Kamthe on 06/06/23.
//

import Foundation

 class ProductListViewModel: ObservableObject {
    
    @Published var products: [ProductInfo] = []
    @Published var favouriteProducts:[ProductInfo] = []
    
    private var service: productServiceProtocol
    
    public init(service: productServiceProtocol) {
        self.service = service
    }
    
    func getProductList() {
        Task {
            let list = try? await service.getProductList()
            guard let listItems = list else { return }
            await MainActor.run {
                products = listItems.products
            }
        }
    }
    
    func markProductFavourite(model: ProductInfo) {
        let isProductSame = favouriteProducts.contains(where: { $0.id == model.id })
        if !isProductSame {
            self.favouriteProducts.append(model)
        } else {
            self.favouriteProducts = favouriteProducts.filter({ product in
                product != model
            })
        }
    }
}
