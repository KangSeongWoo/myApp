//
//  MainViewController.swift
//  myApp
//
//  Created by Kang Seongwoo on 2022/06/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var mainView: UIView?
    @IBOutlet weak var leftView: UIView?
    @IBOutlet weak var rightView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView?.layer.borderWidth = 1
        leftView?.layer.borderWidth = 1
        rightView?.layer.borderWidth = 1
        
        mainView?.layer.borderColor = UIColor.black.cgColor
        leftView?.layer.borderColor = UIColor.blue.cgColor
        rightView?.layer.borderColor = UIColor.yellow.cgColor
    }
    
    let arr = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = arr[indexPath.row]
        //cell.textLabel?.textColor = UIColor.white // <- Changed color here
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //클릭한 셀의 이벤트 처리
        tableView.deselectRow(at: indexPath, animated: true)

        print("Click Cell Number: " + String(indexPath.row))
        
        let alert = UIAlertController(title : String(indexPath.row), message: "하하호호하하호호하하호호"+String(indexPath.row), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated : true, completion:nil)
    }
}

