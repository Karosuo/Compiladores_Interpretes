//
//  DrawLines.swift
//  LogoSpheroControl
//
//  Created by imac on 21/12/16.
//  Copyright © 2016 STR. All rights reserved.
//

import UIKit
import Darwin

class DrawLines: UIView {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func drawRect(rect: CGRect) {
        //drawTurtlePath(30, y1: 30, distance: 50)
    }
    
    static func sind (degrees: Double) -> Double{
        return sin(degrees * M_PI / 180.0)
    }
    
    static func cosd (degrees: Double) -> Double{
        return cos(degrees * M_PI / 180.0)
    }
    
    static func degToRad(degrees: Double) -> Double{
        return M_PI * degrees / 180.0
    }
    
    func drawTurtlePath(x1: Int, y1: Int, distance: Int, theTurtle: Turtle){
        ///context holds the drawing
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context!, 2.0)
        CGContextSetStrokeColorWithColor(context!, UIColor.purpleColor().CGColor)
        
        ///Create path
        CGContextMoveToPoint(context!, 30, 30)
        CGContextAddLineToPoint(context!, 250, 250)
        
        ///Draw the line
        CGContextStrokePath(context!)
    }


}
