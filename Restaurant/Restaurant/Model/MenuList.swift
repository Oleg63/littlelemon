//
//  MenuList.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-09-16.
//

import Foundation

struct MenuList: Decodable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}
