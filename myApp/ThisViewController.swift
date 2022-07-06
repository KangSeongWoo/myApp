//
//  ThisViewController.swift
//  myApp
//
//  Created by Kang Seongwoo on 2022/07/05.
//

import UIKit

class ThisViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
