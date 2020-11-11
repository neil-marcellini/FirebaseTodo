//
//  TaskListViewModel.swift
//  FirebaseTodo
//
//  Created by Neil Marcellini on 11/10/20.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskRepository = TaskRepository()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        taskRepository.$tasks.map { tasks in
            tasks.map { task in
               TaskCellViewModel(task: task)
            }
        }
        .assign(to: \.taskCellViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func addTask(task: Task) {
        let taskVM = TaskCellViewModel(task: task)
        taskCellViewModels.append(taskVM)
    }
}
