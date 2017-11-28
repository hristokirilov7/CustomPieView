//
//  ViewController.swift
//  CustomPieView
//
//  Created by Kirilov, Hristo on 27.11.17.
//  Copyright © 2017 Kirilov, Hristo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pieUIView = PieUIView(frame: CGRect(x: 40, y: 150, width: 300, height: 300))
        
        pieUIView.clockwise = false
        pieUIView.addSegment(segment: Segment(size: 10, fillColor: UIColor.green, textColor: UIColor.black))
        pieUIView.addSegment(segment: Segment(size: 10, fillColor: UIColor.blue, textColor: UIColor.white))
        pieUIView.addSegment(segment: Segment(size: 10, fillColor: UIColor.green, textColor: UIColor.black))
        pieUIView.addSegment(segment: Segment(size: 10, fillColor: UIColor.blue, textColor: UIColor.white))
        pieUIView.addSegment(segment: Segment(size: 10, fillColor: UIColor.green, textColor: UIColor.black))
        pieUIView.addSegment(segment: Segment(size: 10, fillColor: UIColor.blue, textColor: UIColor.white))
        pieUIView.addSegment(segment: Segment(size: 10, fillColor: UIColor.green, textColor: UIColor.black))
        pieUIView.addSegment(segment: Segment(size: 10, fillColor: UIColor.blue, textColor: UIColor.white))
        pieUIView.addSegment(segment: Segment(size: 10, fillColor: UIColor.green, textColor: UIColor.black))
        pieUIView.addSegment(segment: Segment(size: 10, fillColor: UIColor.blue, textColor: UIColor.white))
        
        
        self.view.addSubview(pieUIView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

