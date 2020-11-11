//
//  TaskRepository.swift
//  FirebaseTodo
//
//  Created by Neil Marcellini on 11/11/20.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    let db = Firestore.firestore()
    @Published var tasks = [Task]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        db.collection("tasks").addSnapshotListener { (querySnapShot, error) in
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
        do {
//            Surpresses warning that result isn't used.
            let _ = try db.collection("tasks").addDocument(from: task)
        } catch {
            fatalError("Unable to encode task \(error.localizedDescription)")
        }
        
    }
}
