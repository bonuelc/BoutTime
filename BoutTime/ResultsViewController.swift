//
//  ResultsViewController.swift
//  BoutTime
//
//  Created by Christopher Bonuel on 7/11/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var score: Int!
    var numQuestionsInRound: Int!
    var delegate: GameType!
    
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scoreLabel.text = "\(score)/\(numQuestionsInRound)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playAgainTapped() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
