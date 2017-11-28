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
        
        pieUIView.addSegment(segment: Segment(size: 50, fillColor: UIColor.lightGray.cgColor, textColor: UIColor.white.cgColor))
        pieUIView.addSegment(segment: Segment(size: 25, fillColor: UIColor.red.cgColor, textColor: UIColor.white.cgColor))
        pieUIView.addSegment(segment: Segment(size: 25, fillColor: UIColor.green.cgColor, textColor: UIColor.white.cgColor))
        
        self.view.addSubview(pieUIView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

