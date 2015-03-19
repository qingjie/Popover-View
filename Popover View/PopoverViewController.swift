//
//  ViewController.swift
//  Popover View
//
//  Created by Merlyn on 3/17/15.
//  Copyright (c) 2015 The App Lady. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {
    
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var welcomeMessage: UITextField!
    
    var selectedVideoTitle: String!
    var message: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's backgroundColor to a light mint green color
        self.view.backgroundColor = UIColor(red:0.93, green:0.98, blue:0.93, alpha:1.00)

        // Set the TextField's textColor, font, and text property
        welcomeMessage.textColor = UIColor.brownColor()
        welcomeMessage.font = UIFont.boldSystemFontOfSize(18)
        welcomeMessage.text = message
        
        // Set the Label's text property
        videoTitle.text = selectedVideoTitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

