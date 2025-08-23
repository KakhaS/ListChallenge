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


struct Product: Codable, Identifiable {
    let uuid: String
    let product_name: String
    let brand_name: String
    let description: String?
    let image_url_small: String?
    let image_url_large: String?
    let product_category: String
    let hazard_rating: Int
    let hazard_rating_category: HazardCategory
    
    var id: String { uuid }
}


enum HazardCategory: String, Codable {
    case CLEAN
    case HALF_AND_HALF
    case DIRTY
}
