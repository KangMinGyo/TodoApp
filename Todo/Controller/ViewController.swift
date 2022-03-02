//
//  ViewController.swift
//  Todo
//
//  Created by Kang on 2022/02/25.
//

import UIKit

var todoList: [Task] = []

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
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
    
    //cell 스와이프 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            let data = todoList.map {
                [
                    "task": $0.task,
                    "isComplete": $0.isComplete
                ]
            }
            UserDefaults.standard.removeObject(forKey: "items")
            UserDefaults.standard.set(data, forKey: "items")
            

        } else if editingStyle == .insert {
            
        }
    }
    
    //스와이프 이름 변경 Delete -> 삭제
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    //check 기능 추가
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if todoList[indexPath.row].isComplete == false {
            todoList[indexPath.row].isComplete = true
        } else {
            todoList[indexPath.row].isComplete = false
        }
        saveTask()
        tableView.reloadData()
    }
    
    //UserDefault 저장
    func saveTask() {
        let data = todoList.map {
            [
                "task": $0.task,
                "isComplete": $0.isComplete
            ]
        }
        let userDefault = UserDefaults.standard
        userDefault.set(data, forKey: "items")
    }
    
    //UserDefault 데이터 불러오기
    func loadTask() {
        let userDefault = UserDefaults.standard
        guard let data = userDefault.object(forKey: "items") as? [[String: AnyObject]] else {
            return
        }
        print(data.description)
        
        //todoList에 저장
        print(type(of: data))
        
        todoList = data.map {
            let task = $0["task"] as? String
            let isComplete = $0["isComplete"] as? Bool
            
            return Task(task: task!, isComplete: isComplete!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "할 일"
        
        loadTask()
        
        NotificationCenter.default.addObserver(
                  self,
                  selector: #selector(self.didDismissDetailNotification(_:)),
                  name: NSNotification.Name("DismissDetailView"),
                  object: nil
              )
        
//        todoList.append(Task(task: "test", isComplete: false))
//        todoList.append(Task(task: "test2", isComplete: true))
    }
    
    //dismiss
    @objc func didDismissDetailNotification(_ notification: Notification) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.saveTask()
        }
    }


}

