//
//  Task.swift
//  FirebaseTodo
//
//  Created by Neil Marcellini on 11/10/20.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
    
}

#if DEBUG
let testDataTasks = [
    Task(title: "Implement the UI", completed: true),
    Task(title: "Connect to firebase", completed: false),
    Task(title: "????", completed: false),
    Task(title: "profit", completed: false)
]

#endif
