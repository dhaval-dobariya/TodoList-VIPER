//
//  TodoListViewController.swift
//  TodoList-VIPER
//
//  Created by Dhaval on 22/08/19.
//

import UIKit

class TodoListViewController: UIViewController {

    //MARK: Variables
    var presenter:ViewToPresenterProtocol?
    
    @IBOutlet weak var uiTableView: UITableView!
    var todoArrayList:Array<TodoModel> = Array()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Todo List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.startFetchingTodoList()
    }

    @objc func addTapped() {
        presenter?.showAddNewTaskControllerFrom(viewController: self)
    }

}

extension TodoListViewController:PresenterToViewProtocol {
    func refreshList() {
        presenter?.startFetchingTodoList()
    }
    
    func showTodoList(todoArray: Array<TodoModel>) {
        self.todoArrayList = todoArray
        self.uiTableView.reloadData()
    }
    
    func showError() {
        Utilities.showAlert(strTitle: "Oops!!!", strMessage: "Problem Fetching TodoList!", parent: self, OKButtonTitle: nil, CancelButtonTitle: nil, okBlock: nil, cancelBlock: nil)

    }
    
}


extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoListItemCell
        let todoList = todoArrayList[indexPath.row]
        cell.title.text = todoList.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter?.showTodoListController(navigationController: navigationController!)
        
    }
    
    
}

//MARK: - Todo List Item Cell
class TodoListItemCell:UITableViewCell{
    
    @IBOutlet weak var title: UILabel!
    
}
