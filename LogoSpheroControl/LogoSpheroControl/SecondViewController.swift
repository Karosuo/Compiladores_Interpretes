//
//  SecondViewController.swift
//  LogoSpheroControl
//
//  Created by imac on 21/12/16.
//  Copyright © 2016 STR. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource {

    let commands = [
        ("GO", "GO"),
        ("FORWARD", "FORWARD"),
        ("BACKWARD", "BACKWARD"),
        ("LEFT", "LEFT"),
        ("RIGHT","RIGHT"),
        ("REPEAT","REPEAT N []"),
        ("PRINT", "PRINT []"),
        ("IF", "IF condition []"),
        ("IF-ELSE", "IF condition [] ~ []"),
        ("WORD", "WORD"),
        ("PENUP", "PENUP"),
        ("CLEAR SCREEN", "CLEARSCREEN"),
        ("REPCOUNT", "REPCOUNT"),
        ("SINE", "SIN N"),
        ("COLOR", "COLOR N"),
        ("NOT", "NOT"),
        ("STEPS", "STEPS"),
        ("START", "START"),
        ("PENDOWN","PENDOWN"),
        ("COSINE","COS N"),
        ("NEW","NEW"),
        ("END","END"),
        ("HOME", "HOME"),
        ("BYE", "BYE"),
        ("MAKE","MAKE")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var (commandLabel, commandText) = commands[indexPath.row]
        cell.textLabel?.text = commandLabel
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commands.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}

