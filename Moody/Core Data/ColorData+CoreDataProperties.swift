//
//  ColorData+CoreDataProperties.swift
//  Calmy
//
//  Created by Никита Олтян on 03.03.2021.
//
//

import Foundation
import CoreData


extension ColorData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ColorData> {
        return NSFetchRequest<ColorData>(entityName: "ColorData")
    }

    @NSManaged public var timestamps: Float
    @NSManaged public var date: Date?
    @NSManaged public var colors: NSObject?

}

extension ColorData : Identifiable {

}
