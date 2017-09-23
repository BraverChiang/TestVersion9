//
//  SAFollowButton.swift
//  TestVersion9
//
//  Created by Braver Chiang on 9/23/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit

class SAFollowButton: UIButton {
    
    var isON = false
    
    //override是继承父类的方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    //require是针对子类来继承设计的: 当子类继承时,必须跑完require方法里面的内容
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    //FIXME: UIColor CGColor
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.brown as! CGColor
        layer.cornerRadius = frame.size.height/2
        setTitle(UIColor.white as! CGColor as! String, for: .normal)
        addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool:!isON)
    }
    
    func activateButton(bool: Bool)  {
        isON = bool
        
        _ = bool ? UIColor.blue : .clear
        
    }
    


}
