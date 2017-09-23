//
//  STFaceView.swift
//  TestVersion9
//
//  Created by Braver Chiang on 9/23/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit

class STFaceView: UIView {

    override func draw(_ rect: CGRect) {
        //半径
        let skullRadius = min(bounds.size.width, bounds.size.height)/2
        //圆心
        let skullCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        //画圆圈
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: false)
        //边框宽度
        path.lineWidth = 5.0
        //边框颜色
        UIColor.blue.set()
        path.stroke()
    }
 

}
