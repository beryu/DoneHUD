//
//  DoneHUD.swift
//  DoneAnimation
//
//  Created by Ryuta Kibe on 2015/08/23.
//  Copyright (c) 2015年 blk. All rights reserved.
//

import UIKit

public class DoneHUD: NSObject {
    private static let sharedObject = DoneHUD()
    let doneView = DoneView()

    public static func showInView(view: UIView) {
        DoneHUD.sharedObject.showInView(view, message: nil)
    }
    
    public static func showInView(view: UIView, message: String?) {
        DoneHUD.sharedObject.showInView(view, message: message)
    }
    
    private func showInView(view: UIView, message: String?) {
        // Set size of done view
        let doneViewWidth = min(view.frame.width, view.frame.height) / 2
        let doneViewFrame = CGRectMake(
            (view.frame.width - doneViewWidth) / 2,
            (view.frame.height - doneViewWidth) / 2,
            doneViewWidth,
            doneViewWidth)
        self.doneView.layer.cornerRadius = 8
        self.doneView.frame = doneViewFrame

        // Set message
        self.doneView.setMessage(message)
        
        // Set color of done view
        self.doneView.backgroundColor = UIColor(white: 1, alpha: 0.8)

        // Start animation
        self.doneView.alpha = 0
        view.addSubview(self.doneView)
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.doneView.alpha = 1
        }) { (result: Bool) -> Void in
            self.doneView.drawCheck({ () -> Void in
                let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    UIView.animateWithDuration(0.2, animations: { () -> Void in
                        self.doneView.alpha = 0
                        }) { (result: Bool) -> Void in
                            self.doneView.removeFromSuperview()
                            self.doneView.clear()
                    }
                }
            })
        }
    }
}
