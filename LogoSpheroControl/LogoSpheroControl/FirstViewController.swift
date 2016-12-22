//
//  FirstViewController.swift
//  LogoSpheroControl
//
//  Created by imac on 21/12/16.
//  Copyright © 2016 STR. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {
    @IBOutlet weak var UITurtle: UIImageView!
    
    var theTurtle : Turtle = Turtle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func runTurtleDraw(sender: AnyObject){
        
        /*
        UIView.animateWithDuration(0.5, animations: ({
            self.UITurtle.transform =
                CGAffineTransformMakeRotation(CGFloat(self.theTurtle.getTurtleOrientation()))
            self.theTurtle.setTurtleOrientation(self.theTurtle.getTurtleOrientation()+1)
            print("\(self.theTurtle.getTurtleOrientation())")
        }))*/
        UITurtle.transform =
            CGAffineTransformMakeRotation(CGFloat(DrawLines.degToRad(Double(theTurtle.getTurtleOrientation()))))
        print("\(CGFloat(DrawLines.degToRad(Double(theTurtle.getTurtleOrientation()))))")
        theTurtle.setTurtleOrientation(theTurtle.getTurtleOrientation()+1)
        
    }

}

