//
//  TaskCellViewModel.swift
//  todoList
//
//  Created by Manvendu Pathak on 26/08/21.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
     @Published var task: Task
    
    var id = ""
    @Published var completionStateIconName = ""
    
    
    private var cancellables = Set<AnyCancellable>()
    
    init(task: Task ) {
        self.task =  task
        
        $task
            .map { task in
                task.completed ? "checkmark.circle.fill" : "circle"
         }
            .assign(to: \.completionStateIconName  , on: self)
            .store(in: &cancellables )

        
        $task
            .map { task in
                task.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)


    }
}
