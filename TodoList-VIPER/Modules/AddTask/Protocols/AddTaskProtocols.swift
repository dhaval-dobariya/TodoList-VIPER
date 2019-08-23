//
//  AddTaskProtocols.swift
//  TodoList-VIPER
//
//  Created by Dhaval on 23/08/19.
//

import UIKit

protocol ViewToPresenterAddTaskProtocol : class {
    
    var view: PresenterToViewAddTaskProtocol? {get set}
    var todoListView: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorAddTaskProtocol? {get set}
    var router: PresenterToRouterAddTaskProtocol? {get set}
    func showAddTaskControllerFrom(viewController: TodoListViewController)
    func addTaskClicked(withTitle: String)
    func cancelTaskClicked()
}

protocol PresenterToViewAddTaskProtocol: class {
    func showAddTaskSuccess()
    func showAddTaskFailed(message: String)
}

protocol PresenterToRouterAddTaskProtocol: class {
    static func createAddTaskModule() -> AddTaskViewController
    func presentToAddTaskScreen(fromViewController: TodoListViewController)
    func closeAddTaskScreen()
}

protocol PresenterToInteractorAddTaskProtocol: class {
    var presenter: InteractorToPresenterAddTaskProtocol? {get set}
    func addNewTask(withTitle:String)
}

protocol InteractorToPresenterAddTaskProtocol: class {
    func addNewTaskSuccess()
    func addNewTaskFailed(message: String)
}
