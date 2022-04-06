//
//  itemDetailViewController.swift
//  checklist
//
//  Created by money on 2021/8/21.
//

import UIKit

protocol ItemDetailViewControllerDelegate:class {
    func itemDetailViewControllerDidCancel(_ controller:ItemDetailViewController)
    func itemDetailViewController(_ CONTROLLER:ItemDetailViewController,didFinishAdding item:ChecklistItem)
    func itemDetailViewController(_ controller:ItemDetailViewController,didFinishEditing item:ChecklistItem)
}

class ItemDetailViewController: UITableViewController,
                             UITextFieldDelegate {
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        if let item = itemToEdit {
            title = "Edit item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    // MARK:- Actions
    @IBAction func cancel() {
        delegate?.itemDetailViewControllerDidCancel(self)
    }

    @IBAction func done() {
        if let item = itemToEdit{
        item.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishEditing: item)
        }
        else{
            let item = ChecklistItem()
            item.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

      let oldText = textField.text!
      let stringRange = Range(range, in:oldText)!
      let newText = oldText.replacingCharacters(in: stringRange,
                                              with: string)
      if newText.isEmpty {
        doneBarButton.isEnabled = false
      } else {
        doneBarButton.isEnabled = true
      }
      return true
    }
}
