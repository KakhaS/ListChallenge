//
//  Protocols.swift
//  ProjectTask
//
//  Created by Kakha on 07.09.25.
//

import Foundation



protocol ProductRepository {
    func fetchProducts()async throws -> [Product]
}


