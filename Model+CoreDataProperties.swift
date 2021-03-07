//
//  Model+CoreDataProperties.swift
//  Calmy
//
//  Created by Никита Олтян on 07.03.2021.
//
//

import Foundation
import CoreData


extension Model {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Model> {
        return NSFetchRequest<Model>(entityName: "Model")
    }

    @NSManaged public var colors: [String]?
    @NSManaged public var day: String?
    @NSManaged public var proportions: [Double]?

}

extension Model : Identifiable {

}
