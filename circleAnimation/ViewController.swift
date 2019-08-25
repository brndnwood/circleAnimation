//
//  ViewController.swift
//  circleAnimation
//
//  Created by Brandon Wood on 8/20/19.
//  Copyright © 2019 Brandon Wood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    let shapeLayerLine = CAShapeLayer()
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawLine()
        
        let circle1 = CircleVC(animate: true,
                               height: topView.frame.height,
                               width: topView.frame.width,
                               trackOutline: false,
                               circleColor: UIColor.red.cgColor,
                               startPercent: 0.1)
        
        
        let circle2 = CircleVC(animate: false,
                               height: middleView.frame.height,
                               width: middleView.frame.width,
                               trackOutline: false,
                               circleColor: UIColor.green.cgColor,
                               startPercent: 0.33)
        
        
        let circle3 = CircleVC(animate: false,
                               height: bottomView.frame.height,
                               width: bottomView.frame.width,
                               trackOutline: true,
                               circleColor: UIColor.blue.cgColor,
                               startPercent: 0.5)

        
        
        topView.addSubview(circle1)
        middleView.addSubview(circle2)
        bottomView.addSubview(circle3)
    }
    
    
    

    
    func drawLine() {
        
        // create new path
        let linePath = UIBezierPath()
        
        // set line start point
        linePath.move(to: CGPoint(x: 50, y: 50))
        
        // add the line
        linePath.addLine(to: CGPoint(x:50, y:800))
        
        // add line path to the shape layer
        shapeLayerLine.path = linePath.cgPath
        
        // set line attributes
        shapeLayerLine.lineWidth = 10
        shapeLayerLine.strokeColor = UIColor.blue.cgColor
        shapeLayerLine.lineCap = .round
        shapeLayerLine.strokeEnd = 0
        
        // add shape layer to view
        view.layer.addSublayer(shapeLayerLine)

        
        // tell it to animate the strokeEnd attribute
        let basicAnimationLine = CABasicAnimation(keyPath: "strokeEnd")
        
        // animate strokeEnd all the way around to starting point for 2 seconds
        basicAnimationLine.toValue = 1
        basicAnimationLine.duration = 2
        
        // keep the animation on screen when complete
        basicAnimationLine.isRemovedOnCompletion = false
        basicAnimationLine.fillMode = .forwards
        
        // add the animation to the shape layer
        shapeLayerLine.add(basicAnimationLine, forKey: "blah")
    }

}

