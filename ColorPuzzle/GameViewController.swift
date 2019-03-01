//
//  GameViewController.swift
//  ColorPuzzle
//
//  Created by Anish Krishnan on 2/28/19.
//  Copyright © 2019 anishkrishnan. All rights reserved.
//

import Foundation
import UIKit
//import SKAction

class GameViewController: UIViewController{
    

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    
    var buttons:[UIButton] = []
    
    var gameLogic = GameLogic.init(score: -1)
    
    var gameInt = 10.0
    var gameTimer = Timer()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIElements()
        
        timeLabel.text = String(gameInt)
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(GameViewController.game), userInfo: nil, repeats: true)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateUIElements(){
        buttons = [button1, button2, button3, button4]
        //Update label text and color
        
        colorLabel.text = gameLogic.labelText
        colorLabel.textColor = gameLogic.labelColor
        
        //Update button colors
        for (button, color) in gameLogic.buttonColors{
            buttons[button-1].backgroundColor = gameLogic.COLOR_MAP[color]
        }
        
        scoreLabel.text = String(gameLogic.score)
    }
    
    func gameOver(){
        performSegue(withIdentifier: "gameOverSegue", sender: self)
    }
    
    @objc func game() {
        gameInt -= 0.1
        timeLabel.text = String(format: "%.01f", gameInt)
        
        if gameInt <= 0.0 {
            
            gameTimer.invalidate()
            
            colorLabel.textColor = UIColor.red
            colorLabel.text = "Time's up"
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            gameOver()
            
        }
    }
    
    
    func handleButtonClick(buttonNumber: Int){
        if(gameLogic.buttonColors[buttonNumber] == colorLabel.text){
            gameInt += 1.0
            gameLogic.updateTurn()
            updateUIElements()
        } else{
            colorLabel.text = "GAME OVER"
            gameOver()
        }
    }
    
    @IBAction func clickedButton1(_ sender: UIButton) {
        handleButtonClick(buttonNumber: 1)
    }
    
    @IBAction func clickedButton2(_ sender: UIButton) {
        handleButtonClick(buttonNumber: 2)
    }
    
    @IBAction func clickedButton3(_ sender: UIButton) {
        handleButtonClick(buttonNumber: 3)
    }
    
    @IBAction func clickedButton4(_ sender: UIButton) {
        handleButtonClick(buttonNumber: 4)
    }
}
