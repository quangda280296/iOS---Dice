//
//  ViewController_3.swift
//  Dice
//
//  Created by Do Huy Nam on 3/20/20.
//  Copyright © 2020 Do Huy Nam. All rights reserved.
//

import UIKit

class ViewController_3: UIViewController {

    // MARK: Properties
    @IBOutlet weak var imgExample: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Actions
    @IBAction func onTapUp(_ sender: UIButton) {
        imgExample.frame.origin.y = imgExample.frame.origin.y - 1
        imgExample.frame.size.width = imgExample.frame.size.width - 1
    }
    
    @IBAction func onTapRight(_ sender: UIButton) {
        imgExample.frame.origin.y = imgExample.frame.origin.y + 1
        imgExample.frame.size.width = imgExample.frame.size.width + 1
    }
 
    @IBAction func onTapDown(_ sender: UIButton) {
        imgExample.frame.origin.x = imgExample.frame.origin.x - 1
    }
    
    @IBAction func onTapLeft(_ sender: UIButton) {
        imgExample.frame.origin.x = imgExample.frame.origin.x + 1
    }
}
