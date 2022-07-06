//
//  MainViewController.swift
//  myApp
//
//  Created by Kang Seongwoo on 2022/06/21.
//

import UIKit
import MapKit
import CoreLocation

class MainViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    @IBAction func openPopup(_ sender: Any) {
        let storyboard = UIStoryboard.init(name:"PopUp", bundle:nil)
        
        let popup = storyboard.instantiateViewController(withIdentifier: "PopUp")
        
        popup.modalPresentationStyle = .overCurrentContext
        popup.modalTransitionStyle = .crossDissolve
        
        self.present(popup, animated: true, completion: nil)
    }
    
    @IBAction func Alert_Button(_ sender: Any) {
        let alert = UIAlertController(title : "안녕하세요", message: "하하호호하하호호하하호호", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated : true, completion:nil)
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

