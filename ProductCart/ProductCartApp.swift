//
//  ProductCartApp.swift
//  ProductCart
//
//  Created by Mayur Kamthe on 05/06/23.
//

import SwiftUI

@main
struct ProductCartApp: App {
    var body: some Scene {
        WindowGroup {
            let service = ApiService()
            let model = ProductListViewModel(service: service)
            ProductList().environmentObject(model)
        }
    }
}
