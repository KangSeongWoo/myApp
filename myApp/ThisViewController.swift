//
//  ThisViewController.swift
//  myApp
//
//  Created by Kang Seongwoo on 2022/07/05.
//
import AVKit
import UIKit

class ThisViewController: UIViewController {
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let videoURL = URL(string: "https://www.youtube.com/embed/z0N1DNNce6U?controls=0&autoplay=1&loop=1")
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.videoView.bounds
        self.videoView.layer.addSublayer(playerLayer)
        player.play()
    }
    
    @IBAction func openFullSize(_ sender: Any) {
        // 외부에 링크된 주소를 NSURL 형식으로 변경
        let url = NSURL(string: "https://www.youtube.com/embed/z0N1DNNce6U?controls=0")!

        // AVPlayerController의 인스턴스 생성
        let playerController = AVPlayerViewController()
        // 비디오 URL로 초기화된 AVPlayer의 인스턴스 생성
        let player = AVPlayer(url: url as URL)
        // AVPlayerViewController의 player 속성에 위에서 생성한 AVPlayer 인스턴스를 할당
        playerController.player = player

        self.present(playerController, animated: true){
            player.play() // 비디오 재생
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
