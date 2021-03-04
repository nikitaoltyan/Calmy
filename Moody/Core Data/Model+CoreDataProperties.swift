//
//  Model+CoreDataProperties.swift
//  Calmy
//
//  Created by Никита Олтян on 04.03.2021.
//
//

import Foundation
import CoreData


extension Model {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Model> {
        return NSFetchRequest<Model>(entityName: "Model")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int32

}

extension Model : Identifiable {

}
