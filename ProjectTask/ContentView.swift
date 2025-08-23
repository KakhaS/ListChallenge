//
//  ContentView.swift
//  ProjectTask
//
//  Created by Kakha on 19.08.25.
//

import SwiftUI

struct ContentView: View {
   @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                Text(product.product_name)
            }
            .navigationTitle("Products")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await viewModel.fetchProducts()
        }
        .overlay {
            if viewModel.isLoading
                {
                ProgressView()
            } else if let error = viewModel.errorMessage {
                Text(error).foregroundColor(.red)
            }
        }
    }
}

#Preview {
    ContentView()
}
