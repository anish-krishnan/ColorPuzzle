//
//  GameLogic.swift
//  ColorPuzzle
//
//  Created by Anish Krishnan on 2/28/19.
//  Copyright © 2019 anishkrishnan. All rights reserved.
//

import Foundation
import UIKit


class GameLogic{
    
    let COLOR_LIST: [String] = ["BLUE", "GREEN", "RED", "YELLOW"]
    
    let COLOR_MAP:[String:UIColor] =
        ["BLUE":UIColor(red: 30/255, green: 136/255, blue: 229/255, alpha: 1),
         "GREEN":UIColor(red: 101/255, green: 186/255, blue: 105/255, alpha: 1),
         "RED":UIColor(red: 244/255, green: 67/255, blue: 48/255, alpha: 1),
         "YELLOW":UIColor(red: 255/255, green: 179/255, blue: 0/255, alpha: 1)]
    
    var buttonColors:[Int:String] = [1:"One", 2:"Two", 3:"Three", 4:"Four"]
    var labelText = "BLUE"
    var labelColor : UIColor = UIColor.red
    var score : Int
    
    
    func getRandomColor() -> String {
        return self.COLOR_LIST.randomElement()!
    }
    
    func assignColorsToButtons(){
        var possibleOptions = self.COLOR_LIST
        
        for (button, _) in buttonColors{
            let color = possibleOptions.randomElement()!
            self.buttonColors[button] = color
            possibleOptions = possibleOptions.filter { $0 != color }
        }
        
    }
    
    func updateTurn(){
        self.score += 1
        self.assignColorsToButtons()
        self.labelText = COLOR_LIST.randomElement()!
        self.labelColor = self.COLOR_MAP[self.COLOR_LIST.randomElement()!]!
        
    }
    
    init(score: Int){
        self.score = score
        updateTurn()
    }
    
}
