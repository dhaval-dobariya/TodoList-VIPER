//
//  AddTaskRouter.swift
//  TodoList-VIPER
//
//  Created by Dhaval on 23/08/19.
//

import UIKit

class AddTaskRouter: PresenterToRouterAddTaskProtocol {
    
    
    static var view : AddTaskViewController!
    static var todoListView : PresenterToViewProtocol!

    static func createAddTaskModule() -> AddTaskViewController {
        view = mainstoryboard.instantiateViewController(withIdentifier: "AddTaskViewController") as? AddTaskViewController
        
        let presenter: ViewToPresenterAddTaskProtocol & InteractorToPresenterAddTaskProtocol = AddTaskPresenter()
        let interactor: PresenterToInteractorAddTaskProtocol = AddTaskInteractor()
        let router:PresenterToRouterAddTaskProtocol = AddTaskRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.todoListView = todoListView
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.modalPresentationStyle = .overCurrentContext
        return view
    }
    
    func presentToAddTaskScreen(fromViewController viewController: TodoListViewController) {
        
        AddTaskRouter.todoListView = viewController.presenter?.view
        viewController.present(AddTaskRouter.createAddTaskModule(), animated: true, completion: nil)
    }
    
    func closeAddTaskScreen() {
        AddTaskRouter.view.dismiss(animated: true, completion: nil)
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
