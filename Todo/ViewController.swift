//
//  ViewController.swift
//  Todo
//
//  Created by Kang on 2022/02/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var todo: [String] = ["iOS 개발하기", "알고리즘 풀기"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TodoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTableViewCell
        cell.todoLabel.text = todo[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "할 일"
    }


}

