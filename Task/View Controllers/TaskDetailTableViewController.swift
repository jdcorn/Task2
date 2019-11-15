//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by jdcorn on 11/13/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    // MARK: - Properties
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    var dueDateValue: Date?
    
    // MARK: - Outlets

    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskDueDate: UITextField!
    @IBOutlet weak var taskNotes: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    
    
    // MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        taskDueDate.inputView = dueDatePicker
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let taskName = taskName.text, let taskNotes = taskNotes.text, taskName != "" else {return}
        if let task = task {
            
            
            TaskController.sharedInstance.update(task: task, name: taskName, notes: taskNotes, due: dueDatePicker.date)
        } else {
            
            // Put in due date picker
            TaskController.sharedInstance.add(taskWithName: taskName, notes: taskNotes, due: dueDatePicker.date)
        }
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateValue = dueDatePicker.date
        taskDueDate.text = dueDatePicker.date.stringValue()
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        taskDueDate.resignFirstResponder()
        taskName.resignFirstResponder()
        taskNotes.resignFirstResponder()
    }

    
    
    
    // MARK: - Functions
    
    func updateViews() {
        loadViewIfNeeded()
        guard let task = task else {return}
        taskName.text = task.name
        if let taskDue = task.due {
            taskDueDate.text = taskDue.stringValue()
        }
        if let taskNote = task.notes {
            taskNotes.text = taskNote
        }
    }
    

} // Class end
