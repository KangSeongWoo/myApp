//
//  MainViewController.swift
//  myApp
//
//  Created by Kang Seongwoo on 2022/06/21.
//

import UIKit
import MapKit
import CoreLocation

import WebKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var NavigationBackButton: UIBarButtonItem!
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        // 해당 클로저에서 나중에 indicator 를 반환해주기 위해 상수형태로 선언
        let activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        activityIndicator.center = self.view.center
        
        if traitCollection.userInterfaceStyle == .dark {
            activityIndicator.color = .white
        } else {
            activityIndicator.color = .purple
        }
        
        // 기타 옵션
        activityIndicator.layer.zPosition = 100
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        
        // stopAnimating을 걸어주는 이유는, 최초에 해당 indicator가 선언되었을 때, 멈춘 상태로 있기 위해서
        activityIndicator.stopAnimating()
        
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(activityIndicator)
        
        hideDim()
        
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    func showDim(){
        dimView.layer.zPosition = 10
        dimView.layer.isHidden = false
        NavigationBackButton.isEnabled = false
    }
    
    func hideDim(){
        dimView.layer.zPosition = 0
        dimView.layer.isHidden = true
        NavigationBackButton.isEnabled = true
    }
    
    @IBAction func CallApiButton(_ sender: Any) {
        
    }
    
    @IBAction func showLoading(_ sender: Any) {
        print("loading")
        showDim()
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.hideDim()
            self.activityIndicator.stopAnimating()
        }
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

