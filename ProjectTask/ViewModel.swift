//
//  ViewModel.swift
//  ProjectTask
//
//  Created by Kakha on 19.08.25.
//

import Foundation
import SwiftUI

@MainActor
class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    
    func fetchProducts() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false}

        let urlSring = "https://td-ios-coding-challenge.s3.amazonaws.com/product_data/products.json"
        
        guard let url = URL(string: urlSring) else { return errorMessage = "URL Failure"}
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = try JSONDecoder().decode(ProductResponse.self, from: data)
            products = decoder.products
      
            if products.isEmpty {
                errorMessage = "No Products available"
            }
        }
        catch {
            errorMessage = "Failed to fetch products \(error.localizedDescription)"
        }
        
    }
}
