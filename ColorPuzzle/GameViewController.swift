//
//  GameViewController.swift
//  ColorPuzzle
//
//  Created by Anish Krishnan on 2/28/19.
//  Copyright © 2019 anishkrishnan. All rights reserved.
//

import Foundation
import UIKit

class GameViewController: UIViewController{
    

    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var buttons:[UIButton] = []
    
    var gameLogic = GameLogic.init(score: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIElements()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateUIElements(){
        buttons = [button1, button2, button3]
        //Update label text and color
        
        colorLabel.text = gameLogic.labelText
        colorLabel.textColor = gameLogic.labelColor
        
        //Update button colors
        for (button, color) in gameLogic.buttonColors{
            buttons[button-1].backgroundColor = gameLogic.COLOR_MAP[color]
        }
    }
    
    @IBAction func clickedButton1(_ sender: UIButton) {
        if(gameLogic.buttonColors[1] == colorLabel.text){
            gameLogic.updateTurn()
            updateUIElements()
        } else{
            colorLabel.text = "GAME OVER"
        }
    }
    
    @IBAction func clickedButton2(_ sender: UIButton) {
        if(gameLogic.buttonColors[2] == colorLabel.text){
            gameLogic.updateTurn()
            updateUIElements()
        } else{
            colorLabel.text = "GAME OVER"
        }
    }
    
    @IBAction func clickedButton3(_ sender: UIButton) {
        if(gameLogic.buttonColors[3] == colorLabel.text){
            gameLogic.updateTurn()
            updateUIElements()
        } else{
            colorLabel.text = "GAME OVER"
        }
        
    }
    
}
