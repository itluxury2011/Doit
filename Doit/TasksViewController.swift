//
//  TasksViewController.swift
//  Doit
//
//  Created by Young Hoon OH on 03/01/2017.
//  Copyright © 2017 Young Hoon OH. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = [] // var task는 'Task'라는 배열
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks() // 아랫쪽에 있는 makeTask func를 호출함
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count // row의 갯수가 몇 개인지 설정하는 func
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell() // << 이게 class를 만드는거라공?
        
        selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row] // 위에 있는 tasks가 makeTask를 호출해서 가져온 값들을 'task'에 떄려넣음
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = task.name // 때려넣을 때 name을 때려넣음
        }
        
        return cell // 이 cell 안에 무엇이 있는지 설정해주는 func
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        
        
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    func makeTasks() -> [Task] { // Task 배열에 정보를 추가 입력하는 부분.
        let task1 = Task()
        task1.name = "watch the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "watch the phone"
        task2.important = true
        
        let task3 = Task()
        task3.name = "watch the cup"
        task3.important = false
        
        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTaskViewController // 여기서 CTV를 선언했기 떄문에 밑에줄에서 previousVC를 데려올 수 있는 것
            nextVC.previousVC = self // nextVC가 previousVC한테, 안녕 previousVC야, 너가 나란다. 라고 하는 것. 그러니까 CreateTV에 있는 previousVC에서 신규 추가된 값(append를 통해서 갱신된 값을) nextVC에다가 덮어씌워주는 것!
        }
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            
            nextVC.task = sender as! Task // [Task] 배열 (중 한 항목에서) 다음 task로 연결시켜주는 것.
            nextVC.previousVC = self
        }
        
    }
    
}
