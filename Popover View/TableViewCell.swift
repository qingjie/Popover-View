//
//  TableViewCell.swift
//  Popover View
//
//  Created by Merlyn on 3/18/15.
//  Copyright (c) 2015 The App Lady. All rights reserved.
//

import UIKit
//import QuartzCore

class TableViewCell: UITableViewCell, UIPopoverPresentationControllerDelegate {
    var originalCenter = CGPoint()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // add a tap recognizer
        var recognizer = UITapGestureRecognizer(target: self, action: "handleTap:")
        recognizer.delegate = self
        addGestureRecognizer(recognizer)
    }
    
}
