//
//  BaiCao.swift
//  Dice
//
//  Created by Do Huy Nam on 3/19/20.
//  Copyright © 2020 Do Huy Nam. All rights reserved.
//

import UIKit
        
        class BaiCao : UIViewController {
            
            // MARK: Properties
            @IBOutlet weak var myProgress: UIProgressView!
            @IBOutlet weak var dogImage: UIImageView!
            @IBOutlet weak var myLoading: UIActivityIndicatorView!
            @IBOutlet weak var stepperIncreaseUser: UIStepper!
            @IBOutlet weak var labelUser: UILabel!
            @IBOutlet weak var datePicker: UIDatePicker!
            
            override func viewDidLoad() {
                super.viewDidLoad()
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {
                    (_) in self.myProgress.progress += 0.1
                }
                
                let stringDate = "20/11/2011"
                
                // Tạo DateFormatter
                let dateFormatter = DateFormatter()
                
                // Chọn 1 định dạng để formant tương ứng với stringDate
                dateFormatter.dateFormat = "dd/MM/yyyy"
                
                // Tạo Date từ String
                let date = dateFormatter.date(from: stringDate)
                
                // Set ngày cho datePicker
                datePicker.setDate(date!, animated: true)
            }
            
            // MARK: Action
            @IBAction func valueSlide(_ sender: UISlider) {
                let value = sender.value
                let intValue = Int(value)
                dogImage.image = UIImage(named: "\(intValue).png")
            }
            
            @IBAction func onTapStartButton(_ sender: UIButton) {
                myLoading.startAnimating()
            }
            
            @IBAction func onTapStopButton(_ sender: UIButton) {
                myLoading.stopAnimating()
            }
            
            @IBAction func onTapStepper(_ sender: UIStepper) {
                labelUser.text = String(sender.value)
            }
            
            @IBAction func onTapSegment(_ sender: UISegmentedControl) {
                switch sender.selectedSegmentIndex {
                case 0:
                    print("Segment 0 is selected")
                case 1:
                    print("Segment 1 is selected")
                case 2:
                    print("Segment 2 is selected")
                case 3:
                    print("Segment 3 is selected")
                default:
                    break
                }
            }
            
            @IBAction func onChangedDatePicker(_ sender: UIDatePicker) {
                let selectDate = sender.date
                
                // Tạo DateFormatter
                let dateFormatter = DateFormatter()
                
                // Format ngày bạn muốn hiển thị trên Label
                dateFormatter.dateFormat = "dd MM yyyy"
                
                // Tạo String từ Date
                let stringDate = dateFormatter.string(from: selectDate)
                
                // Hiển thị lên label
                labelUser.text = "\(stringDate)"
                print(selectDate)
            }
        }
