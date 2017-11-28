//
//  PieUIView.swift
//  CustomPieView
//
//  Created by Kirilov, Hristo on 27.11.17.
//  Copyright © 2017 Kirilov, Hristo. All rights reserved.
//

import UIKit

public class PieUIView : UIView {
    public var pieMaxSize : CGFloat = 100
    public var radius : CGFloat = 100
    public var width : CGFloat = 40
    public var clockwise : Bool = true
    
    private var segments : [Segment] = []
    private var pieCenter : CGPoint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
    }
    
    override public func draw(_ rect: CGRect) {
        pieCenter = CGPoint (x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        
        var currentPieFill = CGFloat(0)
        for segment in segments {
            if currentPieFill + segment.size <= pieMaxSize {
                drawSegment(segment: segment, start: currentPieFill)
                currentPieFill += segment.size
            } else {
                let leftFill = pieMaxSize - currentPieFill
                drawSegment(segment: Segment(size: leftFill, fillColor: segment.fillColor, textColor: segment.textColor), start: currentPieFill)
                break
            }
        }
    }
    
    public func addSegment(segment: Segment) {
        segments.append(segment)
    }
    
    public func removeSegment(fillColor: UIColor) {
        segments = segments.filter { $0.fillColor != fillColor }
    }
    
    private func drawSegment(segment: Segment, start: CGFloat) {
        let startAngle = getAngle(part: start)
        let endAngle = getAngle(part: start + segment.size)
        
        let delegatePath = UIBezierPath(arcCenter: pieCenter, radius: radius, startAngle: toRadians(degrees: startAngle), endAngle: toRadians(degrees: endAngle), clockwise: true)

        let firstHalfCenter = getCenter(currentPoint: delegatePath.currentPoint, center: pieCenter, radius: radius, width: width/2)
        delegatePath.addArc(withCenter: firstHalfCenter, radius: width/2, startAngle: toRadians(degrees: endAngle - 180), endAngle: toRadians(degrees: endAngle), clockwise: !clockwise)

        delegatePath.addArc(withCenter: pieCenter, radius: radius + width, startAngle: toRadians(degrees: endAngle), endAngle: toRadians(degrees: startAngle), clockwise: false)


        let secondHalfCenter = getCenter(currentPoint: delegatePath.currentPoint, center: pieCenter, radius: radius + width, width: -width/2)
        delegatePath.addArc(withCenter: secondHalfCenter, radius: width/2, startAngle: CGFloat(toRadians(degrees: startAngle)), endAngle: CGFloat(toRadians(degrees: startAngle - 180)), clockwise: clockwise)
        
        let segmentLayer = CAShapeLayer()
        segmentLayer.path = delegatePath.cgPath
        segmentLayer.fillColor = segment.fillColor.cgColor
        self.layer.addSublayer(segmentLayer)
        
        if (clockwise) {
            addSize(center: firstHalfCenter, segment: segment)
        } else {
            addSize(center: secondHalfCenter, segment: segment)
        }
    }
    
    private func getAngle(part: CGFloat) -> CGFloat {
        return part * 360 / pieMaxSize
    }
    
    private func toRadians(degrees: CGFloat) -> CGFloat {
        return (CGFloat.pi * degrees)/180
    }
    
    private func getCenter(currentPoint: CGPoint, center: CGPoint, radius: CGFloat, width: CGFloat) -> CGPoint {
        let x = (currentPoint.x - center.x) * (radius + width) / (radius) + center.x
        let y = (currentPoint.y - center.y) * (radius + width) / (radius) + center.y
        return CGPoint(x: x , y:y)
    }
    
    private func addSize(center: CGPoint, segment: Segment) {
        let sizeTextView = UITextView(frame: CGRect(x: center.x - width / 2, y: center.y - width / 2.5, width: width, height: width))
        
        sizeTextView.text = segment.size.description
        sizeTextView.font = UIFont.boldSystemFont(ofSize: 13)
        sizeTextView.textColor = segment.textColor
        sizeTextView.backgroundColor = UIColor.clear
        
        self.addSubview(sizeTextView)
    }
}

public struct Segment {
    public var size : CGFloat
    public var fillColor : UIColor
    public var textColor : UIColor
    
    public init (size: CGFloat, fillColor: UIColor, textColor: UIColor) {
        self.size = size
        self.fillColor = fillColor
        self.textColor = textColor
    }
}

