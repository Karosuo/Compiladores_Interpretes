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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func runTurtleDraw(sender: AnyObject){
        let theTurtle : Turtle = Turtle()
        
        /*UIView.animateWithDuration(0.5, animations: ({
            self.UITurtle.transform =
                CGAffineTransformMakeRotation(CGFloat(theTurtle.getTurtleOrientation()))
            theTurtle.setTurtleOrientation(theTurtle.getTurtleOrientation()+1)
        }))*/
        theTurtle.setTurtleOrientation(1)
        print("\(theTurtle.getTurtleOrientation())")
        theTurtle.setTurtleOrientation(theTurtle.getTurtleOrientation()+2)
        print("\(theTurtle.getTurtleOrientation())")
        theTurtle.setTurtleOrientation(theTurtle.getTurtleOrientation()+2)
        print("\(theTurtle.getTurtleOrientation())")
        
    }

}

