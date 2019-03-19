//
//  ViewController.swift
//  ColorPuzzle
//
//  Created by Anish Krishnan on 2/28/19.
//  Copyright © 2019 anishkrishnan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var color_button1: UIButton!
    @IBOutlet weak var color_button2: UIButton!
    @IBOutlet weak var color_button3: UIButton!
    @IBOutlet weak var color_button4: UIButton!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    var color_buttons: [UIButton] = []
    var ui_colors: [UIColor] = []
    
    var flashing_timer = Timer()
    
    @IBAction func clickedStart(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        flashing_timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(HomeViewController.lights), userInfo: nil, repeats: true)
        
        highScoreLabel.text = "High Score: " + String(UserDefaults.standard.integer(forKey: "HighScore"))
    }
    
    @objc func lights() {
        color_buttons = [color_button1, color_button2, color_button3, color_button4]
        ui_colors = [UIColor.red, UIColor.green, UIColor.blue, UIColor.orange]
        for button in color_buttons  {
            let color = ui_colors.randomElement()!
            button.backgroundColor = color
            ui_colors = ui_colors.filter { $0 != color }
        }
    }
}

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

