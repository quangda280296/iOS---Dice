//
//  ViewController_4.swift
//  Dice
//
//  Created by Do Huy Nam on 3/20/20.
//  Copyright © 2020 Do Huy Nam. All rights reserved.
//

import UIKit
import WebKit

class ViewController_4: UIViewController, WKNavigationDelegate {

    // MARK: Properties
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        wvTest = WKWebView(frame: .zero, configuration: webConfiguration)
//        wvTest.navigationDelegate = self
//        //view = wvTest
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        
        // Tạo và set URL cho WKWebView
        let url = URL(string: "https://www.google.com/")
        let request = URLRequest(url: url!)
        
        // Load lên WKWebView
        webView.load(request)
        
        checkButton()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        checkButton()
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
    @IBAction func onBack(_ sender: UIButton) {
        webView.goBack()
        checkButton()
    }
    
    @IBAction func onNext(_ sender: UIButton) {
        webView.goForward()
        checkButton()
    }
    
    // Ẩn hiện hai nút điều khiển trình duyệt
    func checkButton() {
        if webView.canGoBack {
            btnBack.isEnabled = true
        } else {
            btnBack.isEnabled = false
        }
        
        if webView.canGoForward {
            btnNext.isEnabled = true
        } else {
            btnNext.isEnabled = false
        }
    }
}
