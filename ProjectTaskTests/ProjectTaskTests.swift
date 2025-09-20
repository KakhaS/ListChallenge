//
//  ProjectTaskTests.swift
//  ProjectTaskTests
//
//  Created by Kakha on 19.08.25.
//


import XCTest
@testable import ProjectTask

struct ProjectTaskTests {

    final class ProductRepositoryTests: XCTestCase {
        func testFetchProductsReturnsMockData() async throws {
            // Arrange: use your mock repo
            let repo = ProductRepositoryMock()
            
            // Act: fetch dummy products
            let products = try await repo.fetchProducts()
            
            // Assert: validate results
            XCTAssertEqual(products.count, 2, "Expected 2 mock products")
            XCTAssertEqual(products.first?.productName, "Test Shampoo")
            XCTAssertEqual(products.last?.hazardRatingCategory, .DIRTY)
        }
    }
}
