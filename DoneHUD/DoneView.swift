//
//  DoneView.swift
//  DoneHUD
//
//  Created by Ryuta Kibe on 2015/08/22.
//  Copyright (c) 2015 blk. All rights reserved.
//

import UIKit

public class DoneView: UIView {

    public var message: String? {
        didSet {
            if let messageLabel = messageLabel {
                messageLabel.text = message
                messageLabel.frame = CGRect(
                    x: 8,
                    y: frame.height / 5 * 4 - 10,
                    width: frame.width - 16,
                    height: 20)

            } else {
                messageLabel = UILabel()
                messageLabel!.numberOfLines = 1
                messageLabel!.textAlignment = .Center
                messageLabel!.lineBreakMode = .ByTruncatingTail
                messageLabel!.textColor = UIColor.blackColor()
                addSubview(messageLabel!)
            }
        }
    }

    private let lineLayer: CAShapeLayer = CAShapeLayer()
    private var messageLabel: UILabel?
    private var blurView: UIView?
    
    public init() {
        super.init(frame: CGRectZero)
        initialize()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    public func drawCheck(completion: (() -> Void)?) {
        let canvasFrame = CGRect(
          x: frame.width / 4,
          y: message == nil ? frame.height / 3 : frame.height / 5 * 2,
          width: frame.width / 2,
          height: frame.height / 3)

        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(canvasFrame.origin.x, canvasFrame.origin.y + canvasFrame.height / 2))
        path.addLineToPoint(CGPointMake(canvasFrame.origin.x + canvasFrame.width / 3, canvasFrame.origin.y))
        path.addLineToPoint(CGPointMake(canvasFrame.origin.x + canvasFrame.width, canvasFrame.origin.y + canvasFrame.height))
        lineLayer.frame = bounds
        lineLayer.geometryFlipped = true
        lineLayer.path = path.CGPath
        
        layer.addSublayer(lineLayer)
        animate(completion)
    }
    
    public func clear() {
        lineLayer.removeFromSuperlayer()
        lineLayer.removeAllAnimations()
        lineLayer.path = nil

        messageLabel?.removeFromSuperview()
        messageLabel = nil
        message = nil
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        blurView?.frame = bounds
    }

    private func initialize() {
        // Initialize properties
        clipsToBounds = true
        
        // Set default setting to line
        lineLayer.fillColor = UIColor.clearColor().CGColor
        lineLayer.anchorPoint = CGPointMake(0, 0)
        lineLayer.lineJoin = kCALineJoinRound
        lineLayer.lineCap = kCALineCapRound
        lineLayer.contentsScale = layer.contentsScale
        lineLayer.lineWidth = 8
        lineLayer.strokeColor = UIColor.blackColor().CGColor
        
        // Generate blur view
        var blurView: UIView
        if #available(iOS 8.0, *) {
            blurView = UIVisualEffectView(effect: UIBlurEffect(style: .ExtraLight))
        } else {
            blurView = UIView()
            blurView.backgroundColor = UIColor(white: 1, alpha: 0.8)
        }

        self.blurView = blurView

        insertSubview(blurView, atIndex: 0)
        blurView.frame = bounds
    }
    
    private func animate(completion: (() -> Void)?) {
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 0.2
        pathAnimation.fromValue = NSNumber(float: 0)
        pathAnimation.toValue = NSNumber(float: 1)
        CATransaction.begin()
        if let completion = completion {
            CATransaction.setCompletionBlock(completion)
        }
        lineLayer.addAnimation(pathAnimation, forKey:"strokeEndAnimation")
        CATransaction.commit()
    }
}
