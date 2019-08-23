//
//  TodoListProtocols.swift
//  TodoList-VIPER
//
//  Created by Dhaval on 22/08/19.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class {
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingTodoList()
    func showTodoListController(navigationController:UINavigationController)
    func showAddNewTaskControllerFrom(viewController: TodoListViewController)
}

protocol PresenterToViewProtocol: class{
    func refreshList()
    func showTodoList(todoArray:Array<TodoModel>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> TodoListViewController
    func pushToTodoListScreen(navigationConroller:UINavigationController)
    func presentAddTaskScreen(fromViewController: TodoListViewController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchTodoList()
}

protocol InteractorToPresenterProtocol: class {
    func todoListFetchedSuccess(todoListModelArray:Array<TodoModel>)
    func todoListFetchFailed()
}
