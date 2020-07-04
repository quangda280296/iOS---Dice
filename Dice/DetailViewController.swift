//
//  DetailViewController.swift
//  Dice
//
//  Created by Do Huy Nam on 3/23/20.
//  Copyright © 2020 Do Huy Nam. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // Variables
    // Chứa dữ liệu khi UITableView truyền qua
    var item: MenuItem?
    
    // Properties
    @IBOutlet weak var imgContent: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Hiển thị màn thông tin detail từ item
        imgContent.image = UIImage(named: item!.image)
        lblName.text = item!.name
        lblCountry.text = item!.country
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // Actions
    // Đóng màn hình Detail
    @IBAction func onBackClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func test() {
        NSLog("test()", "test")
    }
}
