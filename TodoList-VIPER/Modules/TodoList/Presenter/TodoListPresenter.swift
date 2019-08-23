//
//  TodoListPresenter.swift
//  TodoList-VIPER
//
//  Created by Dhaval on 22/08/19.
//

import Foundation
import UIKit

class TodoListPresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingTodoList() {
        interactor?.fetchTodoList()
    }
    
    func showTodoListController(navigationController: UINavigationController) {
        router?.pushToTodoListScreen(navigationConroller: navigationController)
    }
    
    func showAddNewTaskControllerFrom(viewController: TodoListViewController) {
        router?.presentAddTaskScreen(fromViewController: viewController)
    }
}

extension TodoListPresenter: InteractorToPresenterProtocol{
    func todoListFetchedSuccess(todoListModelArray: Array<TodoModel>) {
        view?.showTodoList(todoArray: todoListModelArray)
    }
    
    func todoListFetchFailed() {
        view?.showError()
    }
    
}
