//
//  STFaceView.swift
//  TestVersion9
//
//  Created by Braver Chiang on 9/23/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit

class STFaceView: UIView {
    
    
    var scale: CGFloat = 0.6
    //该全局的变量就全局化
    private var skullRadius: CGFloat{
        //return 表示初始化一个默认值
        return min(bounds.size.width, bounds.size.height)/2 * scale
    }
    private var skullCenter: CGPoint {
        //return 表示初始化一个默认值
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private func pathForSkull()  -> UIBezierPath{
        //画圆圈
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: false)
        //边框宽度
        path.lineWidth = 5.0
        return path
    }
    

    override func draw(_ rect: CGRect) {
        //边框颜色
        UIColor.green.set()
        pathForSkull().stroke()
    }
 

}

