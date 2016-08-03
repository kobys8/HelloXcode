//
//  ViewController.swift
//  HelloXcode
//
//  Created by Koby Samuel on 9/16/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let appDelegate = UIApplication.sharedApplication()
	let buttonA: UIButton = UIButton(type:UIButtonType.System) as UIButton
	let buttonB: UIButton = UIButton(type:UIButtonType.System) as UIButton
	let theLabel: UILabel = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		var myMessage: UILabel
		myMessage = UILabel(frame:CGRectMake(30.0, 50.0, 300.0, 50.0))
		myMessage.font = UIFont.systemFontOfSize(48.0)
		myMessage.text = "Hello Xcode"
		myMessage.textColor = UIColor(patternImage: UIImage(named: "Background")!)
		view.addSubview(myMessage)
		initInterface()
	}
	
	func initInterface() {
		buttonA.addTarget(self, action: "handleButton:", forControlEvents: UIControlEvents.TouchUpInside)
		buttonA.setTitle("Hello", forState: UIControlState.Normal)
		
		buttonB.addTarget(self, action: "handleButton:", forControlEvents: UIControlEvents.TouchUpInside)
		buttonB.setTitle("Goodbye", forState: UIControlState.Normal)
		
		theLabel.text="Welcome"
		updateInterface()
	}
	
	func updateInterface() {
		let screenWidth: CGFloat = view.bounds.size.width;
		let screenHeight: CGFloat = view.bounds.size.height
		
		for subview in view.subviews {
			subview.removeFromSuperview()
		}
		
		if appDelegate.statusBarOrientation == UIInterfaceOrientation.Portrait ||
			appDelegate.statusBarOrientation == UIInterfaceOrientation.PortraitUpsideDown {
				buttonA.frame=CGRectMake(20.0,20.0,screenWidth-40.0,screenHeight/2-40.0)
				buttonB.frame=CGRectMake(20.0,screenHeight/2+20,screenWidth-40.0,screenHeight/2-40.0)
				theLabel.frame=CGRectMake(screenWidth/2-40,screenHeight/2-10,200.0,20.0)
		} else {
			buttonA.frame=CGRectMake(20.0,60.0,screenWidth-40.0,screenHeight/2-40.0)
			buttonB.frame=CGRectMake(20.0,screenHeight/2+30,screenWidth-40.0,screenHeight/2-40.0)
			theLabel.frame=CGRectMake(screenWidth/2-40,20.0,200.0,20.0)
		}
		
		view.addSubview(buttonA)
		view.addSubview(buttonB)
		view.addSubview(theLabel)
		
	}
	
	func handleButton(theButton: UIButton) {
		theLabel.text = theButton.currentTitle
	}

	override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
		return UIInterfaceOrientationMask.All
	}
	
	override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
		updateInterface()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

