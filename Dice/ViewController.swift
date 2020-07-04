//
//  ViewController.swift
//  Dice
//
//  Created by Do Huy Nam on 3/17/20.
//  Copyright © 2020 Do Huy Nam. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var diceImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DetailViewController().test()
    }

    // MARK: Actions
    @IBAction func rollDice(_ sender: Any) {
        let number = (1...6).randomElement()!
        self.diceImageView.image = UIImage(named: "dice-\(number)")
    }
}
