//
//  SettingViewController.swift
//  Todo
//
//  Created by Kang on 2022/03/03.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var shareButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        shareButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
