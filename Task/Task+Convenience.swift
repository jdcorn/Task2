//
//  Task+Convenience.swift
//  Task
//
//  Created by jdcorn on 11/13/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import Foundation
import CoreData

// Created the extension to Task
extension Task {
    
    // convenience init(names and types of items in coredata model
    convenience init(name: String, notes: String? = nil, due: Date? = nil, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
    }
    
}
