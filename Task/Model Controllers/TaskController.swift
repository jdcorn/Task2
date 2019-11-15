//
//  TaskController.swift
//  Task
//
//  Created by jdcorn on 11/13/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import Foundation
import CoreData

// Define TaskController
class TaskController {
    // MARK: - Properties
    
    // Create shared property
    static let sharedInstance = TaskController()
    

    
    // Add tasks array property with empty default value
    var tasks: [Task] {
        let moc = CoreDataStack.context
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let results = try? moc.fetch(fetchRequest)
        return results ?? []
    }
    
    // Mock Data
    // * could not figure out how to add mock data
    
    // MARK: - CRUD
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        _ = Task(name: name)
        saveToPersistentStore()
        
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
    
    func remove(task: Task) {
        CoreDataStack.context.delete(task)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch {
            print(error, error.localizedDescription)
        }
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    
    
} // Class end


