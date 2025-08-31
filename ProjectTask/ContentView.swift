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
        NavigationView{
                List(viewModel.products) { product in
                    ProductRowView(product: product)
                }
                .listStyle(.plain)
                .refreshable {
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
        
        .task {
            await viewModel.fetchProducts()
        }
 
    }
}

#Preview {
    ContentView()
}
