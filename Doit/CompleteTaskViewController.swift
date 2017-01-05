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
        navigationController!.popViewController(animated: true)
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    var task: Task? = nil //
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task!.important {
            taskLabel.text = "❗️\(task!.name!)"
        } else {
            taskLabel.text = task!.name! // 때려넣을 때 name을 때려넣음
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
