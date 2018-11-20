//
//  ViewController.swift
//  project2
//
//  Created by Selin Ersev on 20.11.2018.
//  Copyright © 2018 Selin Ersev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    var counter : Int = 0
    
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        counter = 0
        label.text = String(counter)
    }
    @IBAction func count(_ sender: UIButton) {
        counter = counter + 1
        self.label.text = String(counter)
    }
    
    func countLongAction() {
        if longPress.state == .began{
            counter = counter + 1
            self.label.text = String(counter)
        }
        else{
            label.text = String(counter)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0"
        longPress = UILongPressGestureRecognizer(target: self, action: Selector(("countLongAction")))
        tapButton.addGestureRecognizer(longPress)
        
    }
    
    
}
