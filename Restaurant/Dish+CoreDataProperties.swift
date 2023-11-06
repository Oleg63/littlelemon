//
//  Dish+CoreDataProperties.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-11-05.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var title: String?
    @NSManaged public var price: String?
    @NSManaged public var image: String?
    @NSManaged public var category: String?
    @NSManaged public var details: String?

}

extension Dish : Identifiable {

}
