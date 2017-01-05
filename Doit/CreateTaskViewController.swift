//
//  CreateTaskViewController.swift
//  Doit
//
//  Created by Young Hoon OH on 03/01/2017.
//  Copyright © 2017 Young Hoon OH. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBOutlet weak var taskNameTextField: UITextField!

    @IBAction func adddTapped(_ sender: Any) {
        // create a task from the outlet infromation
        // add new task to array in previous ViewController
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.name = taskNameTextField.text! // optional ! 를 붙여서 이 자리에 무조건 text가 있을 것이라고 확신.
        task.important = importantSwitch.isOn // on인지 off인지 알려주는게 isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // coredata 적용후 삭제 > previousVC.tasks.append(task) // 이 코드를 통해서 기존 previousVC에다가 task를 '추가'(append)함.
        // coredata 적용후 삭제 > previousVC.tableView.reloadData() // 위에서 append 한 다음에 reload를 해줘야 TVC에서 값이 업데이트 됨
        // pop back
        navigationController!.popViewController(animated: true)
        
    }
    
    // coredata 적용 후 삭제 var previousVC = TasksViewController() // TVC에서 온 값을 previousVC에 덮어씌움
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
