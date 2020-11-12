//
//  FirebaseTodoApp.swift
//  FirebaseTodo
//
//  Created by Neil Marcellini on 11/10/20.
//

import SwiftUI
import Firebase

@main
struct FirebaseTodoApp: App {
    init() {
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
    }
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
