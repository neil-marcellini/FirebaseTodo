//
//  ContentView.swift
//  FirebaseTodo
//
//  Created by Neil Marcellini on 11/10/20.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    @State var presentAddNewItem = false
    
    
    let tasks = testDataTasks
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                        TaskCell(taskCellVM: taskCellVM)
                    }
                    if presentAddNewItem {
                        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false)))
                    }
                }
                
                Button(action:{ presentAddNewItem.toggle() }) {
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
    @ObservedObject var taskCellVM: TaskCellViewModel
    var body: some View {
        HStack {
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "circle")
            TextField("Enter the task title", text: $taskCellVM.task.title)
        }
    }
}
