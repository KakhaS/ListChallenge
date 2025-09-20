//
//  ContentView.swift
//  ProjectTask
//
//  Created by Kakha on 19.08.25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductViewModel(repository: ProductFetching())
    
    var body: some View {
        NavigationView{
            List(viewModel.products) { product in
                ProductRowView(product: product)
            }
            .navigationTitle("Product List")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .refreshable {
                await viewModel.fetchProducts()
            }
            .overlay {
                if viewModel.isLoading
                {
                    ProgressView("Loading Products...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(Color(.systemBackground))
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        Text(error)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(.systemBackground))
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
