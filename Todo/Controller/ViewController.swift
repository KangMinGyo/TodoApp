//
//  ViewController.swift
//  Todo
//
//  Created by Kang on 2022/02/25.
//

import UIKit

var todoList: [Task] = []

class ViewController: UIViewController, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TodoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTableViewCell
        cell.todoLabel.text = todoList[indexPath.row].task
        if todoList[indexPath.row].isComplete {
            cell.checkImage.image = UIImage(systemName: "checkmark.circle")
        } else {
            cell.checkImage.image = UIImage(systemName: "circle")
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "할 일"
        
        NotificationCenter.default.addObserver(
                  self,
                  selector: #selector(self.didDismissDetailNotification(_:)),
                  name: NSNotification.Name("DismissDetailView"),
                  object: nil
              )
        
//        todoList.append(Task(task: "test", isComplete: false))
//        todoList.append(Task(task: "test2", isComplete: true))
    }
    
    @objc func didDismissDetailNotification(_ notification: Notification) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }


}

