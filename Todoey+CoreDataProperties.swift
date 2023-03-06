//
//  Todoey+CoreDataProperties.swift
//  
//
//  Created by Saida Yessirkepova on 03.03.2023.
//
//

import Foundation
import CoreData


extension Todoey {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todoey> {
        return NSFetchRequest<Todoey>(entityName: "Todoey")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var name: String?
    @NSManaged public var section: TodoeySection?

}
