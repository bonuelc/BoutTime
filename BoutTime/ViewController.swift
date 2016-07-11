//
//  ViewController.swift
//  BoutTime
//
//  Created by Christopher Bonuel on 7/2/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var events = HistoricalEventModel()

    @IBOutlet weak var eventLabel0: UILabel!
    @IBOutlet weak var eventLabel1: UILabel!
    @IBOutlet weak var eventLabel2: UILabel!
    @IBOutlet weak var eventLabel3: UILabel!
    
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
        
        events.getNewEvents()
        updateEventLabels()
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
    }

    func updateEventLabels() {
        eventLabel0.text = events[0].description
        eventLabel1.text = events[1].description
        eventLabel2.text = events[2].description
        eventLabel3.text = events[3].description
    }
}

