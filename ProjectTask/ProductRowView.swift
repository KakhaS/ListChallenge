//
//  ProductRowView.swift
//  ProjectTask
//
//  Created by Kakha on 31.08.25.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: product.image_url_small ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "Photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
            .frame(width: 60, height: 60)
            .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(product.product_name)
                    .font(.headline)
                Text(product.brand_name)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Hazard : \(product.hazard_rating)")
                    .font(.caption)
                    .padding(4)
                    .background(hazardColor(category: product.hazard_rating_category))
                    .foregroundColor(.white)
                    .cornerRadius(4)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    
    }
    private func hazardColor(category: HazardCategory) -> Color {
        switch category {
        case .CLEAN: return .green
        case .HALF_AND_HALF: return .yellow
        case .DIRTY : return .red
        }
        
    }
}



#Preview {
    ProductRowView(product: Product( uuid: "0",
                                     product_name: "Georgian Shampoo",
                                     brand_name: "GESHAMPOON",
                                     description: "A gentle shampoo for daily use",
                                     image_url_small: nil,
                                     image_url_large: nil,
                                     product_category: "Hair Care",
                                     hazard_rating: 8,
                                     hazard_rating_category: .DIRTY))
}
