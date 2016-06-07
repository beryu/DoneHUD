//
//  ViewController.swift
//  DoneHUD
//
//  Created by Ryuta Kibe on 2015/08/22.
//  Copyright (c) 2015年 blk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func showButtonWasTapped() {
        DoneHUD.showInView(view)
    }
    
    @IBAction func showWithMessageButtonWasTapped() {
        DoneHUD.showInView(view, message: "Done")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

