//
//  MenuItem.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-09-16.
//

import Foundation

struct MenuItem: Decodable, Identifiable {
    var id = UUID()
    let title: String
    let image: String
    let price: String
    let details: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case image = "image"
        case price = "price"
        case details = "description"
        case category = "category"
    }
}
