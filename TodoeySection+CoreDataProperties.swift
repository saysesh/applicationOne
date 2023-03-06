//
//  TodoeySection+CoreDataProperties.swift
//  
//
//  Created by Saida Yessirkepova on 03.03.2023.
//
//

import Foundation
import CoreData


extension TodoeySection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoeySection> {
        return NSFetchRequest<TodoeySection>(entityName: "TodoeySection")
    }

    @NSManaged public var name: String?
    @NSManaged public var items: Todoey?

}
