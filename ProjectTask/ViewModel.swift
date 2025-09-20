//
//  ViewModel.swift
//  ProjectTask
//
//  Created by Kakha on 19.08.25.
//

import Foundation
import SwiftUI




struct ProductFetching: ProductRepository {
    func fetchProducts() async throws -> [Product] {
        let urlString = "https://td-ios-coding-challenge.s3.amazonaws.com/product_data/products.json"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let (data, _) =  try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ProductResponse.self, from: data)
        
        return response.products
    }
}


@MainActor
class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    private let repository: ProductRepository
    
 init(repository: ProductRepository) {
     self.repository = repository
    }
    
    
    func fetchProducts() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let fetched = try await repository.fetchProducts()
            
            if fetched.isEmpty {
                errorMessage = "No Products available"
            } else {
                products = fetched
            }
            
        }
        catch {
            errorMessage = "Failed to fetch products \(error.localizedDescription)"
        }
        
    }
}
