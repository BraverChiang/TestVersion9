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
    var eyesOpen: Bool = false
    private var skullRadius: CGFloat{
        //return 表示初始化一个默认值. 在Swift语法中:在get里面, 省略get
        return min(bounds.size.width, bounds.size.height)/2 * scale
    }
    private var skullCenter: CGPoint {
        //return 表示初始化一个默认值. 在Swift语法中:在get里面, 省略get
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    //眼睛嘴巴相对脸部的比例
    private struct Ratios{
        static let skullRadiusToEyeOffset: CGFloat = 3
        static let skullRadiusToEyeRadius: CGFloat = 10
        static let skullRadiusToMouthWith: CGFloat = 1
        static let skullRadiusToMouthHeight: CGFloat = 3
        static let skullRadiusToMouthOffset: CGFloat = 3
    }
    //左眼和右眼
    private enum Eye{
        case left
        case right
    }
    
    //MARK:画眼睛边框
    private func pathForEye(_ eye: Eye) -> UIBezierPath {
        
        //眼睛中心: 内部方法##
        func centerOfEye(_ eye: Eye) -> CGPoint {
            let eyeOffset = skullRadius / Ratios.skullRadiusToEyeOffset
            var eyeCenter = skullCenter
            eyeCenter.y -= eyeOffset
            eyeCenter.x += ((eye == .left) ? -1 : 1)*eyeOffset
            return eyeCenter
        }
        //眼睛半径:
        let eyeRadius = skullRadius / Ratios.skullRadiusToEyeRadius
        let eyeCenter = centerOfEye(eye)
        
        //画眼睛边框: 但是要分情况: if else眼睛分开和闭上
        let eyePath: UIBezierPath
        if eyesOpen {
            eyePath = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: false)
            eyePath.lineWidth = 5.0
            return eyePath
        } else{
            eyePath =  UIBezierPath()
            eyePath.move(to: CGPoint(x: eyeCenter.x-eyeRadius, y: eyeCenter.y))
            eyePath.addLine(to: CGPoint(x: eyeCenter.x+eyeRadius, y: eyeCenter.y))
        }
        eyePath.lineWidth = 5.0
        return eyePath
        
    }
    
    //MARK:画面部边框
    private func pathForSkull()  -> UIBezierPath{
        
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: false)
        //边框宽度
        path.lineWidth = 5.0
        return path
    }
    
    //MARK: 核心方法draw
    override func draw(_ rect: CGRect) {
        //边框颜色
        UIColor.green.set()
        pathForSkull().stroke()
        pathForEye(.left).stroke()
        pathForEye(.right).stroke()
    }
 

}

