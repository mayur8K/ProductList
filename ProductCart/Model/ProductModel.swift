//
//  ProductModel.swift
//  ProductCart
//
//  Created by Mayur Kamthe on 05/06/23.
//

import Foundation

// MARK: - ProductDetails
struct Product: Codable {
    let products: [ProductInfo]
}

// MARK: - Product
struct ProductInfo: Codable, Identifiable, Equatable {
    let citrusID: String?
    let title, id: String
    let imageURL: String
    let isAddToCartEnable: Bool
    let saleUnitPrice: Double
    let ratingCount: Double

    enum CodingKeys: String, CodingKey {
        case citrusID = "citrusId"
        case title, id, imageURL, isAddToCartEnable, saleUnitPrice, ratingCount
    }
}

