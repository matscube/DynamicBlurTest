//
//  ViewController.swift
//  DynamicBlurTest
//
//  Created by TakanoriMatsumoto on 2015/01/30.
//  Copyright (c) 2015年 TakanoriMatsumoto. All rights reserved.
//

import UIKit

class BlurView: UIView {
    var currentlocInSelf: CGPoint!
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        let touch = touches.anyObject() as UITouch
        currentlocInSelf = touch.locationInView(self)
    }
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        super.touchesMoved(touches, withEvent: event)
        let touch = touches.anyObject() as UITouch
        var locInSuper = touch.locationInView(superview)

        let x = locInSuper.x - currentlocInSelf.x
        let y = locInSuper.y - currentlocInSelf.y
        self.frame.origin = CGPointMake(x, y)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let blurView = BlurView()
        blurView.backgroundColor = UIColor.blueColor()
        blurView.frame = CGRectMake(0, 0, 100, 100)
        view.addSubview(blurView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

