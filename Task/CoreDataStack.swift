//
//  CoreDataStack.swift
//  Task
//
//  Created by jdcorn on 11/13/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import Foundation
import CoreData


enum CoreDataStack {

    static let container: NSPersistentContainer = {

        
        let container = NSPersistentContainer(name: "Task")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    static var context: NSManagedObjectContext { return container.viewContext }
}
