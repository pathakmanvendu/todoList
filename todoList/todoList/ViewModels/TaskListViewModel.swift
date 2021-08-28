//
//  TaskListViewModels.swift
//  todoList
//
//  Created by Manvendu Pathak on 26/08/21.
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
        self.taskCellViewModels.append(taskVM)
        
    }
}
