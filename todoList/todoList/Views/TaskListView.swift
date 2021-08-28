//
//  ContentView.swift
//  todoList
//
//  Created by Manvendu Pathak on 26/08/21.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var taskListVM = TaskListViewModel()
    let tasks = testDataTasks

    @State var presentAddNewItem = false
    
        
    var body: some View {
      NavigationView{
        
        VStack(alignment: .leading) {
            List{
               ForEach(taskListVM.taskCellViewModels) { taskCellVM in                  TaskCell(taskCellVM: taskCellVM)
               
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                
               }
                if presentAddNewItem{
                    TaskCell(taskCellVM: TaskCellViewModel(task: Task(title:"", completed: false))){ task in
                        self.taskListVM.addTask(task: task)
                        self.presentAddNewItem.toggle()
                    }
                }
            }
            Button(action: { self.presentAddNewItem.toggle()}) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Add new Task")
                }
            }
                .padding()
            
        }
        .navigationBarTitle("Task")
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
    @ObservedObject var taskCellVM : TaskCellViewModel

    var onCommit:  (Task) -> (Void) = { _ in}
    
    var body: some View {
        HStack{
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "circle" )
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.taskCellVM.task.completed.toggle()
                }
            TextField("Enter the task title", text: $taskCellVM.task.title, onCommit:{
                self.onCommit(self.taskCellVM.task)
            })
        }
    }
}
