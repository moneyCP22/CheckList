//
//  AllListsViewController.swift
//  checklist
//
//  Created by money on 2022/2/7.
//
let cellIdentifier="reuseIdentifier"
import UIKit

class AllListsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel!.text = "List\(indexPath.row)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
               didSelectRowAt indexPath: IndexPath) {
      performSegue(withIdentifier: "ShowChecklist", sender: nil)
    }
}
