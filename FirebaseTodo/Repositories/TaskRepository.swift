//
//  TaskRepository.swift
//  FirebaseTodo
//
//  Created by Neil Marcellini on 11/11/20.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    let db = Firestore.firestore()
    @Published var tasks = [Task]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        let userId = Auth.auth().currentUser?.uid
        db.collection("tasks")
            .order(by: "createdTime")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { (querySnapShot, error) in
            if let querySnapshot = querySnapShot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: Task.self)
                        return x
                    } catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }

    func addTask(_ task: Task) {
        var addedTask = task
        addedTask.userId = Auth.auth().currentUser?.uid
        do {
            //Surpresses warning that result isn't used.
            let _ = try db.collection("tasks").addDocument(from: addedTask)
        } catch {
            fatalError("Unable to encode task \(error.localizedDescription)")
        }
        
    }
    
    func updateTask(_ task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("tasks").document(taskID).setData(from: task)
            } catch {
                fatalError("Unable to encode task on update, \(error.localizedDescription)")
            }
        }
    }
}
