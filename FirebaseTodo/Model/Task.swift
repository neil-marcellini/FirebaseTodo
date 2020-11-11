//
//  Task.swift
//  FirebaseTodo
//
//  Created by Neil Marcellini on 11/10/20.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
    
}

#if DEBUG
let testDataTasks = [
    Task(title: "Implement the UI", completed: true),
    Task(title: "Connect to firebase", completed: false),
    Task(title: "????", completed: false),
    Task(title: "profit", completed: false)
]

#endif
