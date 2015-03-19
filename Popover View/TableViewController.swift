//
//  TableViewController.swift
//  Popover View
//
//  Created by Merlyn on 3/17/15.
//  Copyright (c) 2015 The App Lady. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
    var musicVideoList = [String]()
    var cell: UITableViewCell!
    var selectedMusicVideo = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicVideoList = ["Video 1","Video 2","Video 3","Video 4","Video 5"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return musicVideoList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Create a reusable cell
        cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the reusable cell
        cell.imageView?.image = UIImage(named: "music-video-32")
        cell.textLabel?.text = musicVideoList[indexPath.row]
        
        // Set the selected cell's background to a light mint green color
        var bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red:0.93, green:0.98, blue:0.93, alpha:1.00)
        cell.selectedBackgroundView = bgColorView
        
        // Return the configured cell
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            // Put the selected cell's sourceView and sourceRect property value in separate variables
            let selectedCellSourceView = tableView.cellForRowAtIndexPath(indexPath)
            let selectedCellSourceRect = cell.bounds
            
            // Put the view that'll be shown as a popover in a variable
            var popover = UIStoryboard(name: "Main",
                bundle: nil).instantiateViewControllerWithIdentifier("idPopover") as PopoverViewController
            
            // Set two control properties of the popover view
            popover.selectedVideoTitle = musicVideoList[indexPath.row]
            popover.message = "Welcome back Carter! 🍻🍔🍟"
            
            // This statement make the PopoverViewController's view appear as popover on the iOS device
            popover.modalPresentationStyle = UIModalPresentationStyle.Popover
            
            // This statement sets the popover view's anchor arrow's backgroundColor to a light mint green
            popover.popoverPresentationController?.backgroundColor = UIColor(red:0.93, green:0.98, blue:0.93, alpha:1.00)
            
            // Make the popover a delegate of this class
            popover.popoverPresentationController?.delegate = self
            
            // Set the sourceView that activated the popover
            popover.popoverPresentationController?.sourceView = selectedCellSourceView
            
            // Set the area where the popover's anchor arrow will appear
            popover.popoverPresentationController?.sourceRect = selectedCellSourceRect
            
            // Set the direction of the popover's anchor arrow
            popover.popoverPresentationController?.permittedArrowDirections = .Any
            
            // Set the popover view's content width and hight
            popover.preferredContentSize = CGSizeMake(320, 85)
            
            // Show the popoverViewController's view on the device's screen
            self.presentViewController(popover, animated: true, completion: nil)
            
            /***** DEBUG STATEMENTS ****/
            println("Tapped cell's index number: \(indexPath.row)")
            println("Selected cell bounds: \(selectedCellSourceRect)")
            println("Selected music video name:  \(selectedMusicVideo)")
        }
    }

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
