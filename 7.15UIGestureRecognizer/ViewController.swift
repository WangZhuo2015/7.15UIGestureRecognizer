//
//  ViewController.swift
//  7.15UIGestureRecognizer
//
//  Created by 王卓 on 15/4/17.
//  Copyright (c) 2015年 王卓. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label:UILabel!;
    var button:UIButton!;
    var rect:UIView!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label=UILabel()
        button=UIButton()
        label.frame=CGRectMake(0, 0, 300, 30)
        label.center=self.view.center
        button.frame=CGRectMake(150, 300, 80, 30)
        rect=UIView(frame: CGRectMake(0, 0, 50, 50))
        rect.center=self.view.center
        rect.backgroundColor=UIColor.blueColor()
        
        var swipe = UISwipeGestureRecognizer(target: self, action: Selector("swiped:"))
        var tapSingel=UITapGestureRecognizer(target: self, action:("TapedSinglelDid"))
        var tapDouble=UITapGestureRecognizer(target: self, action: ("TapedDoublelDid"))
        var Pinch=UIPinchGestureRecognizer(target: self, action: ("PinchDid:"))
        var rotation=UIRotationGestureRecognizer(target: self, action: ("rotationDid:"))
        var Pan=UIPanGestureRecognizer(target: self, action: ("PanDid:"))
        
        //swipe.direction=UISwipeGestureRecognizerDirection.Right
        tapSingel.numberOfTapsRequired=1
        tapDouble.numberOfTapsRequired=1
        tapSingel.numberOfTouchesRequired=1
        tapDouble.numberOfTouchesRequired=2
        tapSingel.requireGestureRecognizerToFail(tapDouble)
        //Pinch.requireGestureRecognizerToFail(rotation)
        Pan.maximumNumberOfTouches=1
        rect.addGestureRecognizer(Pan)
        
        
        
        button.addTarget(self, action: Selector("tapped"), forControlEvents: UIControlEvents.TouchUpInside)
        button.setTitle("状态清空", forState: UIControlState.Normal)
        button.backgroundColor=UIColor.grayColor()
        label.backgroundColor=UIColor.grayColor()
        
        
        
        
        
        
        self.view.addGestureRecognizer(Pan)
        self.view.addGestureRecognizer(rotation)
        self.view.addGestureRecognizer(Pinch)
        self.view.addGestureRecognizer(tapDouble)
        self.view.addGestureRecognizer(tapSingel)
        self.view.addGestureRecognizer(swipe)
        self.view.addSubview(button)
        self.view.addSubview(label)
        self.view.addSubview(rect)
        
        
        
        
        
        
        
        }

    func PinchDid (recognizer:UIPinchGestureRecognizer){
        label.text="PinchDid,比例\(recognizer.scale)"
    }
    func swiped (recognizer:UISwipeGestureRecognizer){
        label.text="Swipe,方向\(recognizer.direction)"
    }
    func TapedSinglelDid (){
    label.text="TapedSinglelDid被触发"
    }
    func TapedDoublelDid (){
    label.text="TapedDoublelDid被触发"
    }
     
    func rotationDid (recognizer:UIRotationGestureRecognizer){
        label.text="rotationDid,\(recognizer.rotation*(180/CGFloat(M_PI)))"
    }
    func PanDid (recognizer:UIPanGestureRecognizer){
        //label.text="PanDid"
        var point=recognizer.locationInView(self.view)
        rect.center=point;
    }
    
    
    
    func tapped(){
        label.text=""
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

