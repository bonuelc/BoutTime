//
//  ViewController.swift
//  BoutTime
//
//  Created by Christopher Bonuel on 7/2/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    
    var events = HistoricalEventModel()
    var score: Int = 0
    var numQuestionsAnswered: Int = 0
    let numQuestionsInRound: Int = 6
    var timer = NSTimer()
    let secondsPerQuestion: Double = 60
    var secondsLeft: Int = 0

    @IBOutlet weak var eventLabel0: UILabel!
    @IBOutlet weak var eventLabel1: UILabel!
    @IBOutlet weak var eventLabel2: UILabel!
    @IBOutlet weak var eventLabel3: UILabel!
    
    @IBOutlet weak var eventLinkButton0: UIButton!
    @IBOutlet weak var eventLinkButton1: UIButton!
    @IBOutlet weak var eventLinkButton2: UIButton!
    @IBOutlet weak var eventLinkButton3: UIButton!
    
    @IBOutlet weak var downButton0: UIButton!
    @IBOutlet weak var downButton1: UIButton!
    @IBOutlet weak var downButton2: UIButton!
    @IBOutlet weak var upButton1: UIButton!
    @IBOutlet weak var upButton2: UIButton!
    @IBOutlet weak var upButton3: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var bottomInfoLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupArrowImages()
    }
    
    override func viewDidAppear(animated: Bool) {
        resetStats()
        
        startNextRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func downButtonTapped(sender: UIButton) {
        events.rearrangeEvents(sender.tag, indexB: sender.tag + 1)
        updateEventLabels()
    }
    
    @IBAction func upButtonTapped(sender: UIButton) {
        events.rearrangeEvents(sender.tag, indexB: sender.tag - 1)
        updateEventLabels()
    }

    @IBAction func nextButtonTapped(sender: UIButton) {
        
        bottomInfoLabel.text = "Shake to complete"
        enableLinkButtons(false)
        
        enableArrowButtons()
        
        if numQuestionsAnswered == numQuestionsInRound {
            performSegueWithIdentifier("gameEnd", sender: nil)
        } else {
            startNextRound()
        }
    }
    
    func startNextRound() {
        events.getNewEvents()
        updateEventLabels()
        
        nextButton.hidden = true
        timerLabel.hidden = false
        
        startTimer()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let resultsVC = segue.destinationViewController as? ResultsViewController {
            resultsVC.score = score
            resultsVC.numQuestionsInRound = numQuestionsInRound
        }
    }
    
    func startTimer() {
        secondsLeft = Int(secondsPerQuestion)
        tick() // start and show the new timer right away
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.tick), userInfo: nil, repeats: true)
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            checkAnswer()
        }
    }
    
    func tick() {
        let minutes: Int = secondsLeft / 60
        let seconds: Int = secondsLeft % 60
        timerLabel.text = "\(minutes):" + String(format: "%02d", seconds)
        if secondsLeft == 0 {
            checkAnswer()
        }
        secondsLeft -= 1
    }
    
    func checkAnswer() {
        
        bottomInfoLabel.text = "Tap events to learn more"
        enableLinkButtons()
        
        timer.invalidate()
        
        numQuestionsAnswered += 1
        
        timerLabel.hidden = true
        nextButton.hidden = false
        
        enableArrowButtons(false)
        
        if events.inOrder() {
            score += 1
            nextButton.setImage(UIImage(named: "next_round_success.png"), forState: .Normal)
            nextButton.setImage(UIImage(named: "next_round_success.png"), forState: .Highlighted)
        } else {
            nextButton.setImage(UIImage(named: "next_round_fail.png"), forState: .Normal)
            nextButton.setImage(UIImage(named: "next_round_fail.png"), forState: .Highlighted)
        }
    }
    
    @IBAction func eventLinkTapped(sender: UIButton) {
        let website = events[sender.tag].website
        let svc = SFSafariViewController(URL: NSURL(string: website)!)
        svc.delegate = self
        presentViewController(svc, animated: true, completion: nil)
    }
    
    // MARK: Helper methods
    func setupArrowImages() {
        downButton0.setImage(UIImage(named: "down_full_selected.png"), forState: .Highlighted)
        downButton1.setImage(UIImage(named: "down_half_selected.png"), forState: .Highlighted)
        downButton2.setImage(UIImage(named: "down_half_selected.png"), forState: .Highlighted)
        upButton1.setImage(UIImage(named: "up_half_selected.png"), forState: .Highlighted)
        upButton2.setImage(UIImage(named: "up_half_selected.png"), forState: .Highlighted)
        upButton3.setImage(UIImage(named: "up_full_selected.png"), forState: .Highlighted)
    }
    
    func enableArrowButtons(enable: Bool = true) {
        downButton0.enabled = enable
        downButton1.enabled = enable
        downButton2.enabled = enable
        upButton1.enabled = enable
        upButton2.enabled = enable
        upButton3.enabled = enable
    }
    
    func enableLinkButtons(enable: Bool = true) {
        eventLinkButton0.enabled = enable
        eventLinkButton1.enabled = enable
        eventLinkButton2.enabled = enable
        eventLinkButton3.enabled = enable
    }
    
    func updateEventLabels() {
        eventLabel0.text = events[0].description
        eventLabel1.text = events[1].description
        eventLabel2.text = events[2].description
        eventLabel3.text = events[3].description
    }
    
    func resetStats() {
        numQuestionsAnswered = 0
        score = 0
    }
}

