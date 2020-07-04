//
//  ViewController_2.swift
//  Dice
//
//  Created by Do Huy Nam on 3/20/20.
//  Copyright © 2020 Do Huy Nam. All rights reserved.
//

import UIKit
import os.log

class ViewController_2: UIViewController
//, UIPickerViewDataSource, UIPickerViewDelegate
{
    
    // MARK: Properties
    //@IBOutlet weak var pvFoodPicker: UIPickerView!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var imgFood2: UIImageView!
    @IBOutlet weak var imgFood3: UIImageView!
    @IBOutlet weak var viewTest: UIView!
    
    // MARK: Constants
    let arrayImage = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]

    let arrayName = ["Cà ri(Thái Lan)", "Pizza(Italia)", "Socola(Mexico)", "Sushi(Nhật Bản)", "Vịt quay(Trung Quốc)", "Hamburger(Đức)", "Penang(Malaysia)", "Tom(Thái)", "Kem(Mỹ)", "Gà(Châu Phi)"]
    
    // MARK: Variables
    var isPig = true
    var lastRotation: CGFloat = 0
    
    // MARK: viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()

        // lblResult.text = arrayName[0]
        // Do any additional setup after loading the view.
    }
    
//    // Số components của UIPickerView
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    // Số lượng item hiển thị trong UIPickerView
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return arrayName.count
//    }
//
//    // Mỗi item của UIPickerView tương ứng với một phần tử trong arrayImage
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 70))
//        imageView.image = UIImage(named: arrayImage[row])
//        return imageView
//    }
//
//    // Set chiều cao cho mỗi item trong UIPickerView
//    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        return 70
//    }
//
//    // Bắt sự kiện khi UIPickerView scroll đến 1 item
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let name = arrayName[row]
//        lblResult.text = name
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Actions
    @IBAction func onTapGestureClicked(_ sender: UITapGestureRecognizer) {
        if isPig {
            imgFood.image = UIImage(named: "1.jpg")
        } else {
            imgFood.image = UIImage(named: "2.jpg")
        }
        isPig = !isPig
    }
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view{
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @IBAction func onRotatinGesture(_ sender: UIRotationGestureRecognizer) {
            var originalRotation = CGFloat()
        if sender.state == .began {
            print("began")
            sender.rotation = lastRotation
            originalRotation = sender.rotation
        } else if sender.state == .changed {
            print("changing")
            let newRotation = sender.rotation + originalRotation
            sender.view?.transform = CGAffineTransform(rotationAngle: newRotation)
        } else if sender.state == .ended {
            print("end")
            lastRotation = sender.rotation
        }
    }
    
    @IBAction func onPinchGesture(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1.0
        }
    }
}
