//
//  AddTaskInteractor.swift
//  TodoList-VIPER
//
//  Created by Dhaval on 23/08/19.
//

import Foundation

class AddTaskInteractor: PresenterToInteractorAddTaskProtocol {
    
    var presenter: InteractorToPresenterAddTaskProtocol?
    
    func addNewTask(withTitle title: String) {
        let newTask = TodoModel(title: title)
        DataManager.addNewTask(newTask: newTask)
        presenter?.addNewTaskSuccess()
    }
    
    
    
    
}
