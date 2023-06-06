//
//  ApiService.swift
//  ProductCart
//
//  Created by Mayur Kamthe on 05/06/23.
//

import Foundation

struct productUrls {
    static let productUrl = "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328"
}

enum ApiError: Error {
    case badURL
    case serverError
    case parsingError
}

protocol productServiceProtocol {
    func getProductList() async  throws -> Product?
}

final class ApiService: productServiceProtocol {

    private let session: URLSession
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getProductList() async throws -> Product? {
        guard let url = URL(string: productUrls.productUrl) else {
            throw ApiError.badURL
        }
        do {
            guard let data = try? await session.data(from: url) else { return nil }
            let products = try JSONDecoder().decode(Product.self, from: data.0)
            return products

        } catch {
             throw ApiError.parsingError
        }
    }
}
