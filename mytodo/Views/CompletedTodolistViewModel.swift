//
//  CompletedTodolistViewModel.swift
//  mytodo
//
//  Created by APPLE M1 Max on 2023/09/19.
//

import Foundation

final class CompletedTodolistViewModel {
    
    var viewUpdate : () -> Void = {}
    private var coreDataManager = CoreDataManager.shared

    func getTodoFilterlist() -> [Task]{
        return coreDataManager.getTodolistFromCoreData().filter{$0.completed}
    }
    
    func updateTodoCompletedToggle(task: Task){
        coreDataManager.updateCompleted(task: task) {
            self.viewUpdate()
        }
    }
    
    func addToDo(title: String){
        coreDataManager.saveToDoData(title: title) {
            self.viewUpdate()
        }
    }

    func deleteToDo(task:Task){
        coreDataManager.deleteTodo(task: task) {
            self.viewUpdate()
        }
    }
    func updateToDoTitle(task:Task, title:String){
        coreDataManager.updateToDo(task: task, title: title) {
            self.viewUpdate()
        }
    }
}
