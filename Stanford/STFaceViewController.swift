//
//  STFaceViewController.swift
//  TestVersion9
//
//  Created by Braver Chiang on 9/23/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit

//MARK: CCC
class STFaceViewController: UIViewController {

    @IBOutlet weak var faceView: STFaceView!{
        didSet {
            //MARK: pin手势(1:定义手势,包括操作区域,和响应结果.2:响应区域,即View上绑定手势)
            let pinRecognizer = UIPinchGestureRecognizer(target: faceView, action: #selector(STFaceView.changeScale(byReactingTo:)))
            faceView.addGestureRecognizer(pinRecognizer)
            //MARK: tap手势(1:定义手势,包括操作区域,和响应结果. [手势的次数/幅度]  2:响应区域,即View上绑定手势)
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleEyes(byReactingTo:)))
            tapRecognizer.numberOfTapsRequired = 2
            faceView.addGestureRecognizer(tapRecognizer)
            updateUI()
        }
    }
    
    
    @objc func toggleEyes(byReactingTo tapRecognizer: UITapGestureRecognizer){
        if tapRecognizer.state == .ended{
            //1修改Model层
            let eyes: FacialExpression.Eyes = (expression.eyes == .closed) ? .open : .closed
            //2把Model层的数据传回Controller层
            expression = FacialExpression(eyes: eyes, mouth: expression.mouth)
        }
    }
    
    //MARK: 关于didSet{}, 表示的是: 如果expression"有了值", 那就执行updateUI()
    //didSet在自己初始化的时候, 不会执行updateUI(), 必须是外部方法设置了expression
    var expression = FacialExpression(eyes: .open, mouth: .grin) {
        didSet {
            updateUI()
        }
    }
    
    private let mouthCurvatures = [
        FacialExpression.Mouth.grin:0.5, .frown:-1.0, .smile:1.0, .neutral:0.0, .smirk:-0.5
    ]
    
    private func updateUI(){
        //针对FacialExpresion里面的各种复杂内心心境,
        //FaceView进行 表情包渲染.
        switch expression.eyes {
        case .open:
            faceView.eyesOpen = true
        case .closed:
            faceView.eyesOpen = false
        case .squinting:
            faceView.eyesOpen = false
        }
        
        faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0//对optional设置一个0.0的默认值
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
