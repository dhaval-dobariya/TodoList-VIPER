//
//  TodoListRouter.swift
//  TodoList-VIPER
//
//  Created by Dhaval on 22/08/19.
//

import Foundation
import UIKit

class TodoListRouter:PresenterToRouterProtocol {
    
    static func createModule() -> TodoListViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "TodoListViewController") as! TodoListViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = TodoListPresenter()
        let interactor: PresenterToInteractorProtocol = TodoListInteractor()
        let router:PresenterToRouterProtocol = TodoListRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view

    }
    
    func pushToTodoListScreen(navigationConroller: UINavigationController) {
        
    }
    
    func presentAddTaskScreen(fromViewController: TodoListViewController) {
        let router:PresenterToRouterAddTaskProtocol = AddTaskRouter()
        router.presentToAddTaskScreen(fromViewController: fromViewController)
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
