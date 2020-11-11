//
//  ContentView.swift
//  FirebaseTodo
//
//  Created by Neil Marcellini on 11/10/20.
//

import SwiftUI

struct TaskListView: View {
    let tasks = testDataTasks
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(tasks) { task in
                    TaskCell(task: task)
                }
                
                Button(action:{}) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                        Text("Add New Task")
                    }
                    
                }.padding()
            }.navigationBarTitle("Tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
            .previewDevice("iPhone 11")
    }
}

struct TaskCell: View {
    let task: Task
    var body: some View {
        HStack {
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
            Text(task.title)
        }
    }
}
