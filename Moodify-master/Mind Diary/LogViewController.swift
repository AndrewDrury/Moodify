//
//  LogViewController.swift
//  Mind Diary
//
//  Created by Bill Sheng on 2018-03-03.
//  Copyright © 2018 Bill Sheng. All rights reserved.
//

import UIKit
import ToneAnalyzerV3
var data = ibmClass();
class LogViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let vc = navigationController as! DataNavController
        data = vc.data;*/
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
    }
    
    @IBOutlet var userInput: UITextView!
    
    @IBAction func analyze(_ sender: Any) {
        data.input = userInput.text
        //data.input = userInput;
        
        let username = "1621a13a-1b5c-4cdc-afc0-2b213b7fb2b6"
        let password = "5ycL22FtGkgc"
        let version = "2017-07-06"
        let toneAnalyzer = ToneAnalyzer(username: username, password: password, version: version)
        
        let failure = {(error: Error) in print(error)}
        
       toneAnalyzer.getTone(ofText: data.input, failure: failure){ tones in
        print(Float(tones.documentTone[0].tones[0].score));
        
        data.anger = String(((Float(tones.documentTone[0].tones[0].score)) * 100).rounded())
        data.disgust = String(((Float(tones.documentTone[0].tones[1].score)) * 100).rounded())
        data.fear = String(((Float(tones.documentTone[0].tones[2].score)) * 100).rounded())
        data.joy = String(((Float(tones.documentTone[0].tones[3].score)) * 100).rounded())
        data.sadness = String(((Float(tones.documentTone[0].tones[4].score)) * 100).rounded())
        
        data.userHasInputted = true;
        
        var testMaxVal = 0.0
        for counter in 0...4 {
            if tones.documentTone[0].tones[counter].score > testMaxVal {
                data.maxEmotionIndex = tones.documentTone[0].tones[counter].name
                print (tones.documentTone[0].tones[counter].name)
                testMaxVal = tones.documentTone[0].tones[counter].score
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
