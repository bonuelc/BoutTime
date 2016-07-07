//
//  ViewController.swift
//  BoutTime
//
//  Created by Christopher Bonuel on 7/2/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var historicalEventModel = HistoricalEventModel()
    var events: [Event] = []

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
        
        getNewEvents()
        updateEventLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func downButtonTapped(sender: UIButton) {
    }
    
    @IBAction func upButtonTapped(sender: UIButton) {
    }

    @IBAction func nextButtonTapped(sender: UIButton) {
    }

    func updateEventLabels() {
        eventLabel0.text = events[0].eventString
        eventLabel1.text = events[1].eventString
        eventLabel2.text = events[2].eventString
        eventLabel3.text = events[3].eventString
    }
    
    // MARK: Helper functions
    func getNewEvents() {
        events = historicalEventModel.fourRandomEvents()
    }
    
    func rearrangeEvents(indexA: Int, indexB: Int) {
        let temp: Event = events[indexA]
        events[indexA] = events[indexB]
        events[indexB] = temp
    }
}

