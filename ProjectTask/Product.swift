//
//  Product.swift
//  ProjectTask
//
//  Created by Kakha on 19.08.25.
//

import Foundation
import SwiftUI


struct ProductResponse: Codable {
    let products: [Product]
}


struct Product: Identifiable, Codable {
    let id: String
    let productName: String
    let brandName: String
    let description: String?
    let imageUrlSmall: String?
    let imageUrlLarge: String?
    let productCategory: String
    let hazardRating: Int
    let hazardRatingCategory: HazardCategory
    
    private enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case productName = "product_name"
        case brandName = "brand_name"
        case description
        case imageUrlSmall = "image_url_small"
        case imageUrlLarge = "image_url_large"
        case productCategory = "product_category"
        case hazardRating = "hazard_rating"
        case hazardRatingCategory = "hazard_rating_category"
    }
}


enum HazardCategory: String, Codable {
    case CLEAN
    case HALF_AND_HALF
    case DIRTY
}
