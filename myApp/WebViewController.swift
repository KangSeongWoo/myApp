//
//  WebViewController.swift
//  myApp
//
//  Created by Kang Seongwoo on 2022/07/07.
//

import UIKit
import WebKit
//import Alamofire

class WebViewController: UIViewController,WKUIDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton : UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let backButtonImage = UIImage(named: "xmark.png")
        
        let newWidth = 30
        let newHeight = 30
        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        backButtonImage?.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        
        backButton.setImage(newImage, for: .normal)
        
        guard let url = URL(string:"https://golfus.info/brand.html") else {return}
        let request = URLRequest(url: url)
        self.webView?.load(request)
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
