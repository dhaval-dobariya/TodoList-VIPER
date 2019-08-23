//
//  TodoListInteractor.swift
//  TodoList-VIPER
//
//  Created by Dhaval on 22/08/19.
//

import Foundation

class TodoListInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    func sampleData() -> [TodoModel] {
        
        var todoList = [TodoModel]()
        todoList.append(TodoModel(title: "Wake up and ready for the meeting..."))
        todoList.append(TodoModel(title: "Attend meeting..."))
        todoList.append(TodoModel(title: "Team meeting..."))
        
        return todoList
    }
    
    func fetchTodoList() {
        let taskList = DataManager.getExistingTask()
        if(taskList.count == 0){
            let sampleTaskList = sampleData()
            self.presenter?.todoListFetchedSuccess(todoListModelArray: sampleTaskList)
            DataManager.saveTasks(todoList: sampleTaskList)
        }
        else if (taskList.count > 0) {
            self.presenter?.todoListFetchedSuccess(todoListModelArray: taskList)
        }
        else {
            self.presenter?.todoListFetchFailed()
        }
    }
    
    
}
