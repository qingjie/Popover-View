//
//  TableViewController.swift
//  Popover View
//
//  Created by Merlyn on 3/17/15.
//  Copyright (c) 2015 The App Lady. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var selectButton: UIBarButtonItem!
    var musicVideoList = [String]()
    var selectedMusicVideo = String()
    var selectedCellId = Int()
    var cell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        musicVideoList = ["Video 0","Video 1","Video 2","Video 3","Video 4"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return musicVideoList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Create a resusable cell
        cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the reusuable cell
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
            
            // Set the popover selectedMusicVideo variable
            popover.selectedMusicVideo = musicVideoList[indexPath.row]
            popover.message = "Welcome back Carter! 🍻🍔🍟"
            
            // This statement make the PopoverViewController's view appear as popover on the iOS device
            popover.modalPresentationStyle = UIModalPresentationStyle.Popover
            
            // Set the popover propertis
            popover.popoverPresentationController?.backgroundColor = UIColor(red:0.93, green:0.98, blue:0.93, alpha:1.00)
            popover.popoverPresentationController?.delegate = self
            popover.popoverPresentationController?.sourceView = selectedCellSourceView
            popover.popoverPresentationController?.sourceRect = selectedCellSourceRect
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
    
    // Needed for displaying the view as popover on iPhone devices
    func adaptivePresentationStyleForPresentationController(
        controller: UIPresentationController!) -> UIModalPresentationStyle {
            return .None
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }*/

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }

    @IBAction func unwindFromViewController(segue: UIStoryboardSegue) {
    }

}
