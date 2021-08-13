//
//  ViewController.swift
//  TechPod
//
//  Created by 生越冴恵 on 2021/08/12.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate{
    @IBOutlet var table:UITableView!
    
    var songsNameArray=[String]()
    var fileNameArray=[String]()
    var imageNameArray=[String]()
    var audioPlayer:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource=self
        table.delegate=self
        songsNameArray=["カノン","エリーゼのために","G線上のアリア"]
        fileNameArray=["cannon","elise","aria"]
        imageNameArray=["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsNameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell? .textLabel?.text=songsNameArray[indexPath.row]
        cell?.imageView?.image=UIImage(named: imageNameArray[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        audioPlayer=try?AVAudioPlayer(contentsOf: audioPath)
        audioPlayer.play()
    }


}

