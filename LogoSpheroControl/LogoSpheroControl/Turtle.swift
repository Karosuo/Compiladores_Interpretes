//
//  Turtle.swift
//  LogoSpheroControl
//
//  Created by imac on 21/12/16.
//  Copyright © 2016 STR. All rights reserved.
//

import UIKit

class Turtle: NSObject {
    var currentColor : Int
    var currentPoint : CGPoint
    var penActive : Bool
    var colorList = [Int: UIColor]()
    var orientation : Int
    
    override init() {
        currentColor = 0
        currentPoint = CGPoint.init(x:0,y:0)
        penActive = false
        orientation = 0
        
        colorList[0] = UIColor.blackColor()
        colorList[1] = UIColor.blueColor()
        colorList[2] = UIColor.greenColor()
        colorList[3] = UIColor.cyanColor()
        colorList[4] = UIColor.redColor()
        colorList[5] = UIColor.purpleColor()
        colorList[6] = UIColor.yellowColor()
        colorList[7] = UIColor.whiteColor()
        colorList[8] = UIColor.brownColor()
        colorList[9] = UIColor.brownColor()
        colorList[10] = UIColor.greenColor()
        colorList[11] = UIColor.blueColor()
        colorList[12] = UIColor.magentaColor()
        colorList[13] = UIColor.magentaColor()
        colorList[14] = UIColor.orangeColor()
        colorList[15] = UIColor.lightGrayColor()
        
    }
    
    func getTurtleColor() -> Int{
        return currentColor
    }
    
    func setTurtleColor(color: Int){
        currentColor = color
    }
    
    func getTurtleColorUIColor() -> UIColor {
        return colorList[currentColor]!
    }
    
    func isPenDown() -> Bool{
        return penActive
    }
    
    func penUp(){
        penActive = false
    }
    
    func penDown(){
        penActive = true
    }
    
    func getPosition() -> CGPoint{
        return currentPoint
    }
    
    func setPosition(newPoint: CGPoint){
        currentPoint = newPoint
    }
    
    func getTurtleOrientation() -> Int{
        return orientation
    }
    
    func setTurtleOrientation(degrees: Int){
        orientation = degrees
    }
}


