//
//  ViewController.swift
//  
//
//  Created by Riyaz12 on 28/03/17.
//  Copyright © 2017 Riyaz12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var startButton: UIBarButtonItem!
    @IBOutlet var pauseButton: UIBarButtonItem!
    @IBOutlet var resetbutton: UIBarButtonItem!
    
    @IBOutlet var timerlabel: UILabel!
    
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timerlabel.text = String(counter)
        pauseButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startTimer(_ sender: Any) {
        
        if(isPlaying) {
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
        
        timerlabel.textColor = UIColor.blue
        
    }

    @IBAction func pauseTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        timerlabel.textColor = UIColor.red

        
    }
    
    
    @IBAction func resetTimer(_ sender: Any) {
        
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timerlabel.text = String(counter)
        timerlabel.textColor = UIColor.black

        
    }
    func UpdateTimer() {
        counter = counter + 0.1
        timerlabel.text = String(format: "%.1f", counter)
    }
    
}

