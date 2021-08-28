//
//   Task.swift
//  todoList
//
//  Created by Manvendu Pathak on 26/08/21.
//

import Foundation


struct Task: Identifiable  {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}



#if DEBUG
let testDataTasks = [
    Task(title: "Upload project on LinkedIn", completed: true ),
    Task(title: "connect to firebase", completed: false),
    Task(title: "Upload project on GitHub", completed: false),
    Task(title: "Watch movie", completed: false)
    
]
#endif
