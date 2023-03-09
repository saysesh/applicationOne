//
//  DataManager.swift
//  doList
//
//  Created by Saida Yessirkepova on 03.03.2023.
//

import Foundation
import UIKit
import CoreData

protocol ItemManagerDelegate {
    func didUpdateItems(with models: [Todoey])
    func didFail(with error: Error)
}

struct ItemManager {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var delegate: ItemManagerDelegate?
    
    static var shared = ItemManager()
    
    
    func fetchItems(with text: String = "", section: TodoeySection) {
        do {
            let request = Todoey.fetchRequest()
            if text != "" {
                let firstPredicate = NSPredicate(format: "name CONTAINS %@", text)
                let secondPredicate = NSPredicate(format: "section == %@", section)
                
                let andPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [firstPredicate, secondPredicate])
                request.predicate = andPredicate
            } else {
                let secondPredicate = NSPredicate(format: "section == %@", section)
                request.predicate = secondPredicate
            }
            let desc = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [desc]
            
            let models = try context.fetch(request)
            delegate?.didUpdateItems(with: models)
        } catch {
            delegate?.didFail(with : error)
        }
    }
        func createItem(with name: String) {
            let newItem = Todoey(context: context)
            newItem.name = name
            newItem.createdAt = Date()
            do {
                try context.save()
                let request = Todoey.fetchRequest()
                
                
                let desc = NSSortDescriptor(key: "name", ascending: true)
                request.sortDescriptors = [desc]

                let models = try context.fetch(request)
                delegate?.didUpdateItems(with: models)
            } catch {
                print("Following error appeared", error )
            }
        }
        func deleteItem(item: Todoey) {
            context.delete(item)
            do {
                try context.save()
                let models = try context.fetch(Todoey.fetchRequest())
                delegate?.didUpdateItems(with: models)
            } catch {
                print ("Following error appeared", error )
            }
        }
    func updateItem(item: Todoey, newName: String) {
        item.name = newName
        do {
            try context.save()
            let request = Todoey.fetchRequest()
            
            let desc = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [desc]

            let models = try context.fetch(request)
            delegate?.didUpdateItems(with: models)
        } catch {
            print ("Following error appeared", error )
        }
    }
}
