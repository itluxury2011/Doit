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
    
    override func viewDidLoad() {
        super.viewDidLoad() //
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // tasks = makeTasks() // 아랫쪽에 있는 makeTask func를 호출함 <- Coredata 때문에 삭제함
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool){
        // vc가 화면에 나타날 때마다 이 func 이 호출됨. 예를 들어 다른 화면에서 이 화면으로 넘어올 때에도 이 func 이 호출됨.
        getTasks()
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count // row의 갯수가 몇 개인지 설정하는 func
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell() // << 이게 class를 만드는거라공?
        let task = tasks[indexPath.row] // 위에 있는 tasks가 makeTask를 호출해서 가져온 값들을 'task'에 떄려넣음
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name! // 때려넣을 때 name을 때려넣음 // name뒤에 ! 이 없으면 Optional 로 출력되는 문제가 있었음
        }
        
        return cell // 이 cell 안에 무엇이 있는지 설정해주는 func
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    /*   func makeTasks() -> [Task] { // Task 배열에 정보를 추가 입력하는 부분.
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
     
     coredata 때문에 지움.
     */
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    func getTasks () { // coredata로부터 data를 받아오는 것
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("oops we have an error")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            
            nextVC.task = sender as? Task // [Task] 배열 (중 한 항목에서) 다음 task로 연결시켜주는 것.

        }
        
    }
    
}
