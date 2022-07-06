//
//  PopUpViewController.swift
//  myApp
//
//  Created by Kang Seongwoo on 2022/07/06.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var modalArea: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.modalArea.layer.cornerRadius = 10;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func PopUpClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
