//
//  TaskListViewModel.swift
//  FirebaseTodo
//
//  Created by Neil Marcellini on 11/10/20.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.taskCellViewModels = testDataTasks.map { task in
            TaskCellViewModel(task: task)
        }
    }
    
    func addTask(task: Task) {
        let taskVM = TaskCellViewModel(task: task)
        taskCellViewModels.append(taskVM)
    }
}
