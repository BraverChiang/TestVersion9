//
//  ViewController.swift
//  TestVersion9
//
//  Created by Braver Chiang on 9/20/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func myBtn(_ sender: UIButton) {
    }
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "cool"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

