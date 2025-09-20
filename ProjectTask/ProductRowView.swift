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
            AsyncImage(url: URL(string: product.imageUrlSmall ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
            .frame(width: 60, height: 60)
            .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(product.productName)
                    .font(.headline)
                Text(product.brandName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Hazard : \(product.hazardRating)")
                    .font(.caption)
                    .padding(4)
                    .background(hazardColor(category: product.hazardRatingCategory))
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
    ProductRowView(product: Product( id: "0",
                                     productName: "Georgian Shampoo",
                                     brandName: "GESHAMPOON",
                                     description: "A gentle shampoo for daily use",
                                     imageUrlSmall: nil,
                                     imageUrlLarge: nil,
                                     productCategory: "Hair Care",
                                     hazardRating: 8,
                                     hazardRatingCategory: .DIRTY))
}
