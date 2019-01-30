//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by MAC on 12/15/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var data = ["Kimhorn","Kimheng","Kimheang"]
    var data1 = ["kim","ling"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return data.count
        }
        else{
            return data1.count
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")
            cell?.textLabel?.text = data1[indexPath.row]
            cell?.backgroundColor = .red
            return cell!
        }
    }
/*    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var indexPath: IndexPath = tableView.indexPathForSelectedRow!
        let secondSreenVC = segue.destination as! SecondViewController
        if segue.identifier == "second"
        {
            if indexPath.section == 0
            {
                secondSreenVC.text = data[indexPath.row]
            }
            else{
                secondSreenVC.text = data1[indexPath.row]
            }
        }
    }*/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dest = storyboard?.instantiateViewController(withIdentifier: "secondScreen") as!SecondViewController
        if indexPath.section == 0{
            dest.text = data[indexPath.row]
        }
        else{
            dest.text = data[indexPath.row]
        }
        navigationController?.pushViewController(dest, animated: true)
    }
/*    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
            if indexPath.section == 0{
                self.data.remove(at: indexPath.row)
            }else{
                self.data1.remove(at: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.middle)
            tableView.reloadData()
        }
        return [delete]
    }
*/
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view,_) in
            if indexPath.section == 0{
                self.data.remove(at: indexPath.row)
            }else{
                self.data1.remove(at: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.middle)
            tableView.reloadData()
        }
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view,_) in
            print("Edited")
        }
        delete.image = #imageLiteral(resourceName: "icons8-delete")
        edit.image = #imageLiteral(resourceName: "icons8-edit_file")
        return UISwipeActionsConfiguration(actions: [delete,edit])
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

