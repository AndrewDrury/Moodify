//
//  StatsViewController.swift
//  Mind Diary
//
//  Created by Bill Sheng on 2018-03-03.
//  Copyright © 2018 Bill Sheng. All rights reserved.
//


import UIKit


class StatsViewController: ViewController {

    override func viewDidLoad() {
                usleep(1500000)
        emotionanger.transform = emotionanger.transform.scaledBy(x: 1, y: 5)
        emotiondisgust.transform = emotiondisgust.transform.scaledBy(x: 1, y: 5)
        emotionfear.transform = emotionfear.transform.scaledBy(x: 1, y: 5)
        emotionjoy.transform = emotionjoy.transform.scaledBy(x: 1, y: 5)
        emotionsadness.transform = emotionsadness.transform.scaledBy(x: 1, y: 5)
        
        if(data.userHasInputted)
        {
            angerTxt.text = data.anger + "%"
            emotionanger.progress = ((Float(data.anger))!/100)
            
            disgustTxt.text = data.disgust + "%"
            emotiondisgust.progress = ((Float(data.disgust))!/100)
            
            fearTxt.text = data.fear + "%"
            emotionfear.progress = ((Float(data.fear))!/100)
            
            joyTxt.text = data.joy + "%"
            emotionjoy.progress = ((Float(data.joy))!/100)
            
            sadnessTxt.text = data.sadness + "%"
            emotionsadness.progress = ((Float(data.sadness))!/100)
            
            print(emotionsadness.progress)
        }
        super.viewDidLoad()
    }
    
    @IBOutlet var emotionsadness: UIProgressView!
    @IBOutlet var emotionjoy: UIProgressView!
    @IBOutlet var emotionfear: UIProgressView!
    @IBOutlet var emotiondisgust: UIProgressView!
    @IBOutlet var emotionanger: UIProgressView!
    @IBOutlet weak var angerTxt: UILabel!
    @IBOutlet weak var disgustTxt: UILabel!
    @IBOutlet weak var fearTxt: UILabel!
    @IBOutlet weak var joyTxt: UILabel!
    @IBOutlet weak var sadnessTxt: UILabel!
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
