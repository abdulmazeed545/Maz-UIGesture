//
//  ViewController.swift
//  Maz-UIGesture
//
//  Created by Shaik abdul mazeed on 04/01/21.
//  Copyright © 2021 Shaik abdul mazeed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    
    var thirdView:UIView!
    //Creating a global variable for label
    var label = UILabel()
    var label1 = UILabel()
    var lblArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var i:Int = 1
    var j:Int = 1
    var swipeLeft:UISwipeGestureRecognizer!
    var swipeRight:UISwipeGestureRecognizer!
    var swipeLeft1:UISwipeGestureRecognizer!
    var swipeRight1:UISwipeGestureRecognizer!
    var pinch:UIPinchGestureRecognizer!
    var tap:UITapGestureRecognizer!
    var pan:UIPanGestureRecognizer!
    var button:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        display()
        swipeTopView()
        swipeBottomView()
    
    }
    //Creating a function for to display the default data
    func display()
    {
        //Creating a label for topview
        label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: topView.frame.size.width , height: topView.frame.size.height)
        label.text = lblArray[0]
        label.textAlignment = .center
        label.layer.cornerRadius = 40
        label.clipsToBounds = true
        label.backgroundColor = UIColor.systemTeal
        label.font = UIFont(name: "AvenirNext-BoldItalic", size: 45)
        label.textColor = UIColor.systemOrange
        topView.addSubview(label)
        
        
        //Creating a label for bottom view
        label1 = UILabel()
        label1.frame = CGRect(x: 0, y: 0, width: bottomView.frame.size.width , height: bottomView.frame.size.height)
        label1.text = lblArray[1]
        label1.layer.cornerRadius = 40
        label1.clipsToBounds = true
        label1.textAlignment = .center
        label1.backgroundColor = UIColor.systemTeal
        label1.font = UIFont(name: "AvenirNext-BoldItalic", size: 45)
        label1.textColor = UIColor.systemOrange
        bottomView.addSubview(label1)
        
        //Creating an instance to the button
        button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: 150, y: 50, width: 60, height: 30)
        button.setTitle("ADD", for: UIControl.State.normal)
        button.setTitleColor(.darkText, for: UIControl.State.normal)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 10
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        
    }
    //Creating a funciton to perform swipe action to the top view
    func swipeTopView()
    {
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(alphaTop))
        swipeLeft.direction = .left
        topView.addGestureRecognizer(swipeLeft)
        swipeLeft.addTarget(self, action: #selector(alphaBot))
        swipeLeft.addTarget(self, action: #selector(remove))
        swipeLeft.addTarget(self, action: #selector(buttonAction))
        
        
               
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(alphaTop))
        swipeRight.direction = .right
        topView.addGestureRecognizer(swipeRight)
        swipeRight.addTarget(self, action:  #selector(alphaBot))
        swipeRight.addTarget(self, action: #selector(buttonAction))
        //swipeRight.addTarget(self, action: #selector(remove))
        

    }
    //Creating a funciton to perform swipe action to the bottom view
    func swipeBottomView()
    {
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(alphaBot))
        swipeLeft.direction = .left
        bottomView.addGestureRecognizer(swipeLeft)
        swipeLeft.addTarget(self, action: #selector(buttonAction))
        
                       
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(alphaBot))
        swipeRight.direction = .right
        bottomView.addGestureRecognizer(swipeRight)
        swipeRight.addTarget(self, action: #selector(buttonAction))
        
    }
    //Creating a function for top view to display data
    @objc func alphaTop()
    {
        
        if (i < 26)
        {
       
            label = UILabel()
            label.frame = CGRect(x: 0, y: 0, width: topView.frame.size.width , height: topView.frame.size.height)
            label.text = lblArray[i]
            label.layer.cornerRadius = 40
            label.clipsToBounds = true
            label.textAlignment = .center
            label.backgroundColor = UIColor.systemTeal
            label.font = UIFont(name: "AvenirNext-BoldItalic", size: 45)
            label.textColor = UIColor.systemOrange
            topView.addSubview(label)
            
            panGesture(type: topView)
            
            
        }else
        {
            i = 0
        }
        i += 1

    }
    //Creating a function for bottom view to display data
    @objc func alphaBot()
    {
        if (j < 26)
        {
            label1 = UILabel()
            label1.frame = CGRect(x: 0, y: 0, width: bottomView.frame.size.width , height: bottomView.frame.size.height)
            label1.text = lblArray[j]
            label1.layer.cornerRadius = 40
            label1.clipsToBounds = true
            label1.textAlignment = .center
            label1.backgroundColor = UIColor.systemTeal
            label1.font = UIFont(name: "AvenirNext-BoldItalic", size: 45)
            label1.textColor = UIColor.systemOrange
            bottomView.addSubview(label1)
            pinchGRB()
            panGesture(type: bottomView)
            
        }else
        {
            j = 0
        }
        j += 1
        
    }
    //Creating a function to remove the topview and display frames
    @objc func remove()
    {
        topView.removeFromSuperview()
        bottomView.frame = topView.frame
      
    }
    //Creating a funciton for performing button action
    @objc func buttonAction()
    {
        if (j < 26)
        {
            //Creating an instance to the third view
            thirdView = UIView()
            thirdView.frame = CGRect(x: 42, y: 482, width: 330, height: 200)
            thirdView.center = view.center
            view.addSubview(thirdView)
            //Creatign an instance to the label
            label1 = UILabel()
            label1.frame = CGRect(x: 0, y: 0, width: thirdView.frame.size.width , height: thirdView.frame.size.height)
            label1.text = lblArray[j]
            label1.layer.cornerRadius = 40
            label1.clipsToBounds = true
            label1.textAlignment = .center
            label1.backgroundColor = UIColor.systemTeal
            label1.font = UIFont(name: "AvenirNext-BoldItalic", size: 45)
            label1.textColor = UIColor.systemOrange
            thirdView.addSubview(label1)
            //Calling function
            //pinchGR(views: thirdView)
            pinchGR()
            panGesture(type: thirdView)
            //pinchAction(labels: label1)
        }else
        {
            j = 0
        }
        j += 1
        
     
    }
    //Creating a function for pinch gesture to bottom view
    func pinchGRB()
    {
        pinch = UIPinchGestureRecognizer()
        bottomView.addGestureRecognizer(pinch)
        pinch.addTarget(self, action: #selector(pinchBAction(view2:)))
    }
    //Creating a function for pinch action to bottom view
    @objc func pinchBAction(view2:UIView)
    {
        
        bottomView.transform = bottomView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
        
    }
    //Creating a function for pinch gesture
    func pinchGR()
    {
        pinch = UIPinchGestureRecognizer()
        thirdView.addGestureRecognizer(pinch)
        pinch.addTarget(self, action: #selector(pinchAction(view2:)))
    }
    //Creating a function for pinch action
    @objc func pinchAction(view2:UIView)
    {
        
        thirdView.transform = thirdView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
        
    }
    //Creating a function for pan gesture
    func panGesture(type:UIView)
    {
        //Creating an instance to the pan gesture
        pan = UIPanGestureRecognizer(target: self, action: #selector(panAction))
        pan.velocity(in: type)
        pan.minimumNumberOfTouches = 1
        type.addGestureRecognizer(pan)
        
    }
    //Creating a function for performing pan actions
    @objc func panAction()
    {
        //Creating a variable to store pan view
        let mazeedView = pan.view
        let mazTranslatedView = pan.translation(in: view)
        
        mazeedView?.center.x += mazTranslatedView.x
        mazeedView?.center.y += mazTranslatedView.y
        
        pan.setTranslation(.zero, in: view)
        
    }
    

}

