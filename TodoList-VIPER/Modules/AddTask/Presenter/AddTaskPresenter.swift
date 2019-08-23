//
//  AddTaskPresenter.swift
//  TodoList-VIPER
//
//  Created by Dhaval on 23/08/19.
//

import UIKit

class AddTaskPresenter: ViewToPresenterAddTaskProtocol {
   
    var view: PresenterToViewAddTaskProtocol?
    var todoListView: PresenterToViewProtocol?

    var interactor: PresenterToInteractorAddTaskProtocol?
    
    var router: PresenterToRouterAddTaskProtocol?
    
    func showAddTaskControllerFrom(viewController: TodoListViewController) {
        router?.presentToAddTaskScreen(fromViewController: viewController)
    }
  
    func addTaskClicked(withTitle title: String) {
        interactor?.addNewTask(withTitle: title)
    }
    
    func cancelTaskClicked() {
        router?.closeAddTaskScreen()
        
    }
    
    
    
}

extension AddTaskPresenter: InteractorToPresenterAddTaskProtocol {
    func addNewTaskSuccess() {
//        view?.showAddTaskSuccess()
        router?.closeAddTaskScreen()
        todoListView?.refreshList()
    }
    
    func addNewTaskFailed(message: String) {
        view?.showAddTaskFailed(message: message)
    }   
    
}
