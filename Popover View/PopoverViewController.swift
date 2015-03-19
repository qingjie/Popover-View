//
//  ViewController.swift
//  Popover View
//
//  Created by Merlyn on 3/17/15.
//  Copyright (c) 2015 The App Lady. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {
    
    @IBOutlet weak var videoTitle: UILabel!  // Holds the selected music video title
    @IBOutlet weak var welcomeMessage: UITextField!
    
    var selectedMusicVideo = String()
    var message = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the view's background to a light mint green color
        self.view.backgroundColor = UIColor(red:0.93, green:0.98, blue:0.93, alpha:1.00)
        
        // Set the TextField's text color
        welcomeMessage.textColor = UIColor.purpleColor()
        
        // Set the view's Label and TextField properties
        videoTitle.text = selectedMusicVideo
        welcomeMessage.text = message
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

