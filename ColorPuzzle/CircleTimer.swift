//
//  CircleTimer.swift
//  ColorPuzzle
//
//  Created by Anish Krishnan on 3/1/19.
//  Copyright © 2019 anishkrishnan. All rights reserved.
//

import Foundation
import UIKit
import GLKit

class CircleTimer: UIView{
    // MARK: Properties
    static var centerX:CGFloat = 55 //CircleTimer.bounds.size.width
    static var centerY:CGFloat = 55
    static var radius:CGFloat = 50
    
    static var currentAngle:Float = -90
    static var circleColor = UIColor.blue
    
    let timeBetweenDraw:CFTimeInterval = 0.01
    
    // MARK: Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    func setup() {
        self.backgroundColor = UIColor.clear
        Timer.scheduledTimer(timeInterval: timeBetweenDraw, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // MARK: Drawing
    @objc func updateTimer() {

//        if CircleTimer.currentAngle < 270 {
//            CircleTimer.currentAngle -= 1 //Float(((timeRemaining/totalTime) * 360) - 450)
//
//        }
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        
        let path = CGMutablePath() //.init() ??
        
        let centerPoint: CGPoint = CGPoint(x: CircleTimer.centerX, y: CircleTimer.centerY)
        
//        CGPathAddArc(path, nil, centerX, centerY, radius, -CGFloat(M_PI/2), CGFloat(GLKMathDegreesToRadians(currentAngle)), false)

        path.addArc(center: centerPoint, radius: CircleTimer.radius, startAngle: -CGFloat(Double.pi/2), endAngle: CGFloat(GLKMathDegreesToRadians(CircleTimer.currentAngle)), clockwise: false)
        
        
        
        context.addPath(path)
        context.setStrokeColor(CircleTimer.circleColor.cgColor)
        context.setLineWidth(3)
        context.strokePath()
    }
}
