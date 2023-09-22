//
//  CoreDataManager.swift
//  mytodo
//
//  Created by APPLE M1 Max on 2023/09/19.
//

import Foundation
import CoreData
import UIKit

final class CoreDataManager{
    
    static let shared = CoreDataManager()
    private init() {}
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    private lazy var context = appDelegate?.persistentContainer.viewContext
    
    private let modelName: String = "Task"

    func getTodolistFromCoreData() -> [Task] {
        var todolist: [Task] = []

        if let context = context {

            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            
            do {

                if let fetchedTodolist = try context.fetch(request) as? [Task] {
                    todolist = fetchedTodolist
                }
            } catch {
                print("가져오는 것 실패")
            }
        }
        
        return todolist
    }

    func saveToDoData(title: String?, completion: @escaping () -> Void) {

        if let context = context {

            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {


                if let toDoData = NSManagedObject(entity: entity, insertInto: context) as? Task {


                    toDoData.title = title
                    toDoData.id = UUID()
                    toDoData.createDate = Date.now
                    toDoData.completed = false
                    toDoData.mDate = Date.now
                    appDelegate?.saveContext()
                }
            }
        }
        completion()
    }

    
    func deleteTodo(task: Task, completion: @escaping () -> Void) {
        
        guard let id = task.id else {
            completion()
            return
        }
        

        if let context = context {

            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)

            request.predicate = NSPredicate(format: "id == %@", id as CVarArg)

            do {

                if let fetchedTodolist = try context.fetch(request) as? [Task] {


                    if let targetToDo = fetchedTodolist.first {
                        context.delete(targetToDo)
                        appDelegate?.saveContext()
                    }
                }
                completion()
            } catch {
//                print("지우는거 실패")
                completion()
            }
        }
    }
    

    func updateToDo(task: Task, title: String, completion: @escaping () -> Void) {
        
        guard let id = task.id else {
            completion()
            return
        }
        

        if let context = context {

            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)

            request.predicate = NSPredicate(format: "id = %@", id as CVarArg)

            do {

                if let fetchedTodolist = try context.fetch(request) as? [Task] {

                    if let targetToDo = fetchedTodolist.first {


                        targetToDo.title = title
                        targetToDo.mDate = Date.now
                        appDelegate?.saveContext()
                    }
                }
                completion()
            } catch {
                completion()
            }
        }
    }

    func updateCompleted(task: Task, completion: @escaping () -> Void) {
        
        guard let id = task.id else {
            completion()
            return
        }
        

        if let context = context {

            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)

            request.predicate = NSPredicate(format: "id = %@", id as CVarArg)

            do {

                if let fetchedTodolist = try context.fetch(request) as? [Task] {
                    if let targetToDo = fetchedTodolist.first {


                        targetToDo.completed.toggle()
                        targetToDo.mDate = Date.now
                        appDelegate?.saveContext()
                    }
                }
                completion()
            } catch {
                completion()
            }
        }
    }
}

