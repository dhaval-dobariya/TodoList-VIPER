//
//  AddTaskViewController.swift
//  TodoList-VIPER
//
//  Created by Dhaval on 23/08/19.
//

import UIKit

class AddTaskViewController: UIViewController {

    //MARK: Variables
    var presenter: ViewToPresenterAddTaskProtocol?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Add New Task"

    }
    
    //MARK: IBActions
    @IBAction func addButtonClicked(_ sender: UIButton) {
        let text = Utilities.getTrimmedString(strTarget: titleTextField.text)
        if Utilities.isValidString(str: text) {
            
            presenter?.addTaskClicked(withTitle: text)
        }
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        presenter?.cancelTaskClicked()
    }
    
    
}

extension AddTaskViewController: PresenterToViewAddTaskProtocol {
    func showAddTaskSuccess() {
        Utilities.showAlert(strTitle: "Wow!!!", strMessage: "Task successfully Added!", parent: self, OKButtonTitle: nil, CancelButtonTitle: nil, okBlock: nil, cancelBlock: nil)

    }
    
    func showAddTaskFailed(message: String) {
        Utilities.showAlert(strTitle: "Oops!!!", strMessage: message, parent: self, OKButtonTitle: nil, CancelButtonTitle: nil, okBlock: nil, cancelBlock: nil)

    }
    
    
}
