//
//  CircleVC.swift
//  circleAnimation
//
//  Created by Brandon Wood on 8/24/19.
//  Copyright © 2019 Brandon Wood. All rights reserved.
//

import UIKit

class CircleVC: UIView {
    
    var timer = Timer()
    
    let circle = CAShapeLayer()
    let track = CAShapeLayer()
    
    var percent = UILabel()
    
    var animate : Bool = false
    var height : CGFloat = 0
    var width : CGFloat = 0
    var trackOutline : Bool = false
    var startPercent : CGFloat = 0
    var percentageCGFloat : CGFloat = 0
    
    var circleColor : CGColor = UIColor.red.cgColor
    
    required init(animate: Bool, height: CGFloat, width: CGFloat, trackOutline : Bool, circleColor : CGColor, startPercent : CGFloat) {
        super.init(frame: .zero)
        self.animate = animate
        self.height = height
        self.width = width
        self.trackOutline = trackOutline
        self.circleColor = circleColor
        self.startPercent = startPercent
        
        self.percentageCGFloat = self.startPercent * 0.8
        
        drawCircle()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        drawCircle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        drawCircle()
    }
    
    
    



    
    
    fileprivate func drawCircle() {
        
        

        let cgpoint = CGPoint(x: 207, y: self.height/2)
        
        
        // create the circle path
        let path = UIBezierPath(arcCenter: cgpoint, radius: 60, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        let trackPath = UIBezierPath(arcCenter: cgpoint, radius: 60, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        
        
        // add path to the shapeLayer
        circle.path = path.cgPath
        track.path = trackPath.cgPath
        
        
        // set attributes for circle
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeColor = circleColor
        circle.lineWidth = 10
        circle.lineCap = .round
        circle.strokeEnd = self.percentageCGFloat
        
        percent = UILabel(frame: CGRect(x: self.width/2-45, y: self.height/2-50, width: 100, height: 100))
        percent.text = String(format: "%.0f", self.startPercent*100) + "%"
        percent.textAlignment = .center
        percent.font = .systemFont(ofSize: 30.0, weight: .bold)
        

        
        // set attributes for circle track
        track.fillColor = UIColor.clear.cgColor
        track.strokeColor = UIColor.lightGray.cgColor
        
        if (self.trackOutline) {
            track.lineWidth = 18
        } else {
            track.lineWidth = 10
        }
        
        track.lineCap = .round
        //        shaperLayerCircleTrack.strokeEnd = 1
        
        self.layer.addSublayer(track)
        self.layer.addSublayer(circle)
        self.addSubview(percent)
        
        if (self.animate) {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCircle), userInfo: nil, repeats: true)
        }
        
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
    
    
    @objc private func updateCircle() {
        
        circle.strokeEnd += 0.05
        let percentage = ((100 * circle.strokeEnd)/80) * 100
        
        if (circle.strokeEnd >= 0.8) {
            self.timer.invalidate()
            percent.text = "100%"
        } else {
            percent.text = String(format: "%.0f", percentage) + "%"

        }
    }


}
