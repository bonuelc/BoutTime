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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        events = historicalEventModel.fourRandomEvents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

