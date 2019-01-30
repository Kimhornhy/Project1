//
//  SecondViewController.swift
//  UITableViewDemo
//
//  Created by MAC on 12/15/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var text: String? 
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = text{
            label.text = text
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
