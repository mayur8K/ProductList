//
//  ViewModelTests.swift
//  ProductCartTests
//
//  Created by Mayur Kamthe on 06/06/23.
//

import Foundation
import XCTest
@testable import ProductCart


class ProductListViewModelTests: XCTestCase {
    
    var viewmodel = ProductListViewModel(service: ApiService())
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFavouriteAdded()  {
        let model: [ProductInfo] = [
            ProductInfo(citrusID: "123", title: "1" ,id: "123", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", isAddToCartEnable: false, saleUnitPrice: 5.8, ratingCount: 5.0)
        ]

        viewmodel.markProductFavourite(model: model[0])
        XCTAssertNotNil(viewmodel.favouriteProducts)
        
    }
    
    func testFavouriteRemoved() async throws {
        let model: [ProductInfo] = [
            ProductInfo(citrusID: "123", title: "1" ,id: "123", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", isAddToCartEnable: false, saleUnitPrice: 5.8, ratingCount: 5.0),
            ProductInfo(citrusID: "123", title: "1" ,id: "1234", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", isAddToCartEnable: false, saleUnitPrice: 5.8, ratingCount: 5.0),
            ProductInfo(citrusID: "123", title: "1" ,id: "123", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", isAddToCartEnable: false, saleUnitPrice: 5.8, ratingCount: 5.0)

        ]

        viewmodel.markProductFavourite(model: model[0])
        viewmodel.markProductFavourite(model: model[1])
        viewmodel.markProductFavourite(model: model[2])

        XCTAssertEqual(viewmodel.favouriteProducts.count, 1)
        
    }
}
