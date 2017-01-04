//
//  CompleteTaskViewController.swift
//  Doit
//
//  Created by Young Hoon OH on 04/01/2017.
//  Copyright © 2017 Young Hoon OH. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBAction func completeTapped(_ sender: Any) {
        
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData() // 위에서 append 한 다음에 reload를 해줘야 TVC에서 값이 업데이트 됨
        navigationController!.popViewController(animated: true)
        
    }
    
    var task = Task()
    var previousVC = TasksViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.important {
            taskLabel.text = "❗️\(task.name)"
        } else {
            taskLabel.text = task.name // 때려넣을 때 name을 때려넣음
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
