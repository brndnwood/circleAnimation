//
//  ViewController.swift
//  circleAnimation
//
//  Created by Brandon Wood on 8/20/19.
//  Copyright © 2019 Brandon Wood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let shapeLayerCircle = CAShapeLayer()
    let shaperLayerCircleTrack = CAShapeLayer()
    let shapeLayerLine = CAShapeLayer()
    
    var fillColor: CGColor = UIColor.clear.cgColor
    var timer : Timer?

    var percent : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        drawCircle()
        drawLine()

    }
    
    
    
    fileprivate func drawCircle() {
        
        // create the circle path
        let path = UIBezierPath(arcCenter: view.center, radius: 60, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        let trackPath = UIBezierPath(arcCenter: view.center, radius: 60, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)


        
        // add path to the shapeLayer
        shapeLayerCircle.path = path.cgPath
        shaperLayerCircleTrack.path = trackPath.cgPath
        
        
        // set attributes for circle
        shapeLayerCircle.fillColor = fillColor
        shapeLayerCircle.strokeColor = UIColor.red.cgColor
        shapeLayerCircle.lineWidth = 10
        shapeLayerCircle.lineCap = .round
        shapeLayerCircle.strokeEnd = 0
        
        percent = UILabel(frame: CGRect(x: view.frame.width/2-45, y: view.frame.height/2-50, width: 100, height: 100))
        percent!.text = "0%"
        percent!.textAlignment = .center
        percent!.font = .systemFont(ofSize: 30.0, weight: .bold)
        
        // set attributes for circle track
        shaperLayerCircleTrack.fillColor = fillColor
        shaperLayerCircleTrack.strokeColor = UIColor.lightGray.cgColor
        shaperLayerCircleTrack.lineWidth = 10
        shaperLayerCircleTrack.lineCap = .round
//        shaperLayerCircleTrack.strokeEnd = 1
        
        view.layer.addSublayer(shaperLayerCircleTrack)
        
        view.layer.addSublayer(shapeLayerCircle)
        view.addSubview(percent!)


        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCircle), userInfo: nil, repeats: true)
        
//        // tell it to animate the strokeEnd attribute
//        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
//
//        // animate strokeEnd all the way around to starting point for 2 seconds
//        basicAnimation.toValue = 1
//        basicAnimation.duration = 3
//
//        // keep the animation on screen when complete
//        basicAnimation.isRemovedOnCompletion = false
//        basicAnimation.fillMode = .forwards
//
//        // add the animation to the shape layer
//        shapeLayerCircle.add(basicAnimation, forKey: "blah")
    }
    
    
    @objc func updateCircle() {
        print(shapeLayerCircle.strokeEnd)
        shapeLayerCircle.strokeEnd += 0.05
        let percentage = ((100 * shapeLayerCircle.strokeEnd)/80) * 100
        percent!.text = String(format: "%.0f", percentage) + "%"
        
        if (shapeLayerCircle.strokeEnd >= 0.8) {
            timer!.invalidate()
        }
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

