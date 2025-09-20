//
//  ProductRepositoryMock.swift
//  ProjectTaskTests
//
//  Created by Kakha on 07.09.25.
//

import Foundation
@testable import ProjectTask

class ProductRepositoryMock: ProductRepository {
    
    func fetchProducts() async throws -> [Product] {
  
        return [
            Product(
                id: "test-product-1",
                productName: "Test Shampoo",
                brandName: "Mock Brand",
                description: "A premium test shampoo for all hair types",
                imageUrlSmall: "https://example.com/small1.jpg",
                imageUrlLarge: "https://example.com/large1.jpg",
                productCategory: "Personal Care",
                hazardRating: 2,
                hazardRatingCategory: .CLEAN
            ),
            Product(
                id: "test-product-2",
                productName: "Mock Conditioner",
                brandName: "Test Company",
                description: "Deep conditioning treatment for damaged hair",
                imageUrlSmall: "https://example.com/small2.jpg",
                imageUrlLarge: "https://example.com/large2.jpg",
                productCategory: "Personal Care",
                hazardRating: 5,
                hazardRatingCategory: .HALF_AND_HALF
            ),
            Product(
                id: "test-product-3",
                productName: "Sample Face Cream",
                brandName: "Demo Skincare",
                description: "Anti-aging face cream with natural ingredients",
                imageUrlSmall: "https://example.com/small3.jpg",
                imageUrlLarge: "https://example.com/large3.jpg",
                productCategory: "Skincare",
                hazardRating: 8,
                hazardRatingCategory: .DIRTY
            )
        ]
    }
}
