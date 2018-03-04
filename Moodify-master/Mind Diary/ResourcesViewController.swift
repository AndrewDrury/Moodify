//
//  ResourcesViewController.swift
//  Mind Diary
//
//  Created by Bill Sheng on 2018-03-03.
//  Copyright © 2018 Bill Sheng. All rights reserved.
//

import UIKit
import ToneAnalyzerV3
class ResourcesViewController: ViewController {
    
    @IBOutlet weak var advice: UITextView!
    
    
    @IBAction func url(_ sender: Any) {
        let randomAdvice = Int(arc4random_uniform(5))
        var highestScoreEmotion = ["", "", "", "", ""]
        switch data.maxEmotionIndex {
        case "Anger":
            highestScoreEmotion = data.angerResources
            advice.text = data.userMessage[0]
        case "Disgust":
            highestScoreEmotion = data.disgustResources
            advice.text = data.userMessage[1]
        case "Fear":
            highestScoreEmotion = data.fearResources
            advice.text = data.userMessage[2]
        case "Joy":
            highestScoreEmotion = data.joyResources
            advice.text = data.userMessage[3]
        case "Sadness":
            highestScoreEmotion = data.sadnessResources
            advice.text = data.userMessage[4]
        default:
            advice.text = "Neutral input - not enough information"
            print("Please try again")
        }
        UIApplication.shared.openURL(NSURL(string: highestScoreEmotion[randomAdvice])! as URL)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var highestScoreEmotion = ""
        if (data.userHasInputted)
        {
            switch data.maxEmotionIndex {
            case "Anger":
                highestScoreEmotion = data.userMessage[0]
                
            case "Disgust":
                highestScoreEmotion = data.userMessage[1]
            case "Fear":
                highestScoreEmotion = data.userMessage[2]
            case "Joy":
                highestScoreEmotion = data.userMessage[3]
            case "Sadness":
                highestScoreEmotion = data.userMessage[4]
            default:
                highestScoreEmotion = "Not clear enough - please try again."
            }
        }
        else {
            highestScoreEmotion = "Please log in your thoughts to view personalized resources."
        }
        advice.text = highestScoreEmotion;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
