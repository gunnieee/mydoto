//
//  TodolistViewModel.swift
//  mytodo
//
//  Created by APPLE M1 Max on 2023/09/19.
//

import Foundation
import CoreData


final class TodolistViewModel {
    
    var viewUpdate : () -> Void = {}
    
    private var coreDataManager = CoreDataManager.shared

    func getTodolist() -> [Task]{
        return coreDataManager.getTodolistFromCoreData()
    }
    
    func updateTodoCompletedToggle(task: Task){
        coreDataManager.updateCompleted(task: task) {
            self.viewUpdate()
        }
    }
    
    func addTodo(title: String){
        coreDataManager.saveToDoData(title: title) {
            self.viewUpdate()
        }
    }

    func deleteTodo(task: Task){
        coreDataManager.deleteTodo(task: task) {
            self.viewUpdate()
        }
    }
    
    func updateTodoTitle(task:Task, title:String){
        coreDataManager.updateToDo(task: task, title: title) {
            self.viewUpdate()
        }
    }
}
