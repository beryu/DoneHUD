//
//  ViewController.swift
//  DoneAnimation
//
//  Created by Ryuta Kibe on 2015/08/22.
//  Copyright (c) 2015年 blk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func showButtonWasTapped() {
        DoneHUD.showInView(self.view)
    }
    
    @IBAction func showWithMessageButtonWasTapped() {
        DoneHUD.showInView(self.view, message: "Done")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

