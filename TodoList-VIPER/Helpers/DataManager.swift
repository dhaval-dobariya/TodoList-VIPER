//
//  DataManager.swift
//  TodoList-VIPER
//
//  Created by Dhaval on 23/08/19.
//

import Foundation

class DataManager {
    
    class func getExistingTask() -> [TodoModel] {
        var todoList = [TodoModel]()
        if let data = USER_DEFAULTS.OBJ_USER_DEFAULT.object(forKey: USER_DEFAULTS.TASK_LIST) as? Data {
            todoList = NSKeyedUnarchiver.unarchiveObject(with: data) as! [TodoModel]
        }
        
        return todoList
    }
    
    class func addNewTask(newTask: TodoModel)  {
        var todoList = DataManager.getExistingTask()
        todoList.append(newTask)
        
        saveTasks(todoList: todoList)
    }
    
    class func saveTasks(todoList: [TodoModel]) {
        let data = NSKeyedArchiver.archivedData(withRootObject: todoList)
        USER_DEFAULTS.OBJ_USER_DEFAULT.set(data, forKey: USER_DEFAULTS.TASK_LIST)
        USER_DEFAULTS.OBJ_USER_DEFAULT.synchronize()
    }
}
