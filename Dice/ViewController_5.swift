//
//  ViewController_5.swift
//  Dice
//
//  Created by Do Huy Nam on 3/20/20.
//  Copyright © 2020 Do Huy Nam. All rights reserved.
//

import UIKit
import AVFoundation // Import để sử dụng AVAudioPlayer

struct MenuItem {
    var name: String
    var country: String
    var image: String
}

// UITableViewDataSource cung cấp các Function để hiển thị UITableView từ mảng
class ViewController_5: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Constants
    let array = [ MenuItem(name: "Cà ri", country: "Thái Lan", image: "1.jpg"),
                  MenuItem(name: "Pizza", country: "Italia", image: "2.jpg"),
                  MenuItem(name: "Socola", country: "Mexico", image: "3.jpg"),
                  MenuItem(name: "Vịt quay", country: "Trung Quốc", image: "4.jpg")]
    
    // Variables
    var selectedItem: MenuItem!

    // Properties
    @IBOutlet weak var myTableView: UITableView!
    
    
    // AVAudioPlayer để điều khiển audio
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Lấy đường dẫn file audio
        guard let path = Bundle.main.path(forResource: "If_I_Had_a_Chicken.mp3", ofType: nil) else {
                return
        }
        
        // Tạo Url từ đường dẫn
        guard let url = URL(string: path) else {
            return
        }
        
        // Set đường dẫn audio cho AVAudioPlayer
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            // Error
        }
        
        // Để sử dụng UITableViewDataSource
        myTableView.dataSource = self
        // Sử dụng UITableViewDelegate
        myTableView.delegate = self
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
    // Play audio
    @IBAction func Play(_ sender: UIButton) {
        player.play()
    }
    
    @IBAction func Pause(_ sender: UIButton) {
        player.pause()
    }
    
    @IBAction func Stop(_ sender: UIButton) {
        player.stop()
    }
    
    // UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Số item (Cell) mà UITableView hiển thị bằng với số item trong mảng
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    // Trong mỗi Cell sẽ hiển thị những gì trong hàm này
    /*func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdenifier = "myCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdenifier) else {
            fatalError("The dequeued cell is a nil instance")
        }

        // Lấy item trong mảng để hiển thị
        let item = array[indexPath.row]

        // Đây là các thuộc tính mặc định của cell có Style là Subtitle
        cell.imageView?.image = UIImage(named: item.image)
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.country

        return cell
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdenifier = "myCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdenifier) as? MyTableViewCell else {
            fatalError("The dequeued cell is not an instance of MyTableViewCell")
        }
        
        let item = array[indexPath.row]
        cell.visualizeCell(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedItem = array[indexPath.item]
        self.performSegue(withIdentifier: "showDetailFlow", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DetailViewController {
            controller.item = selectedItem
        }
    }
}
