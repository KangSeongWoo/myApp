//
//  MusicPlayerViewController.swift
//  myApp
//
//  Created by Kang Seongwoo on 2022/07/27.
//

import UIKit
import AVFoundation

class MusicPlayerViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    weak var timer : Timer?
    
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerInit()
    }
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
//    override func viewWillAppear(_ animated: Bool) {
//        appDelegate.shouldSupportAllOrientation = false
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        appDelegate.shouldSupportAllOrientation = true
//    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape == true {
            print("가로모드")
// 
//            topView.transform = topView.transform.rotated(by: .pi/2)
//            bottomView.transform = bottomView.transform.rotated(by: .pi/2)
        } else {
            print("세로모드")
        }
    }
    
    func playerInit(){
        let url = URL.init(string: "https://vt.tumblr.com/tumblr_o600t8hzf51qcbnq0_480.mp4")
        
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
        timeLabel.textAlignment = .center
        
        if let thisPlayer = self.player, let thisCurrentItem = thisPlayer.currentItem {
            let durationTime : CMTime = thisCurrentItem.asset.duration
            
            timeSlider.value = 0
            timeSlider.minimumValue = 0
            timeSlider.maximumValue = Float(CMTimeGetSeconds(durationTime))
            print("timer is started")
        } else {
            return
        }
        
        // 음악 재생이 끝나면 videoDidEnded가 실행되게 관찰주웅~~
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnded), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
    }
    
    @objc func videoDidEnded() {
        print("audio is ended")
        player?.seek(to: .zero)
        playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
    }
    
    @IBAction func play(_ sender: Any) {
        if player?.rate == 0{
            print("play")
            player!.play()
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
                if let thisPlayer = self.player, let thisCurrentItem = thisPlayer.currentItem {
                    let currentTime = self.convertNSTimeInterval2String(CMTimeGetSeconds(thisCurrentItem.currentTime()))
                    self.timeSlider.setValue(Float(CMTimeGetSeconds(thisCurrentItem.currentTime())), animated: true)
                    self.timeLabel.text = currentTime
                } else {
                    return
                }
            })
            
            playButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        }else{
            print("pause")
            player!.pause()
            playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
        }
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        timer?.invalidate()
        player?.pause()
        
        timer = nil
        player = nil
        
        self.navigationController?.popViewController(animated: true)
    }
    
    // 00:00 형태의 문자열로 변환
    func convertNSTimeInterval2String(_ time:TimeInterval) -> String {
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }
    
    @IBAction func slider(_ sender: UISlider) {
        if let thisPlayer = self.player {
            let tempCMTime = CMTimeMakeWithSeconds(Float64(sender.value), preferredTimescale: 1)
            thisPlayer.seek(to: tempCMTime)
        } else {
            return
        }
    }
}
