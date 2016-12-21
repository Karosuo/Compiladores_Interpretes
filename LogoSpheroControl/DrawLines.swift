//
//  DrawLines.swift
//  LogoSpheroControl
//
//  Created by imac on 20/12/16.
//  Copyright © 2016 STR. All rights reserved.
//

import UIKit

class DrawLines: UIView {

    var colorList = [Int: UIColor]()
    var currentColorIndex : Int?
    var currentPoint : CGPoint?
    var targetPoint: CGPoint?

    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    override init(frame: CGRect) {
        super.init(frame: frame) // calls designated initializer
    }
    
    convenience init(frame: CGRect, defaultColor: Int){
        self.init(frame: frame) // calls the initializer above
        colorList[0] = UIColor.black
        colorList[1] = UIColor.blue
        colorList[2] = UIColor.green
        colorList[3] = UIColor.cyan
        colorList[4] = UIColor.red
        colorList[5] = UIColor.purple
        colorList[6] = UIColor.yellow
        colorList[7] = UIColor.white
        colorList[8] = UIColor.brown
        colorList[9] = UIColor.brown
        colorList[10] = UIColor.green
        colorList[11] = UIColor.blue
        colorList[12] = UIColor.magenta
        colorList[13] = UIColor.magenta
        colorList[14] = UIColor.orange
        colorList[15] = UIColor.lightGray
        
        currentColorIndex = defaultColor
        
        currentPoint = CGPoint.init(x:0,y:0) //Default start point, upper left corner
    }
    
    
    public func setCurrentColor(newColor: Int) {
        currentColorIndex = newColor
    }
    
    public func getCurrentColor() -> Int{
        return currentColorIndex!
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(3.0)
        context?.setStrokeColor((colorList[getCurrentColor()]?.cgColor)!)
        
        let customPath = UIBezierPath()
        customPath.move(to: currentPoint!)
        
    }

}
