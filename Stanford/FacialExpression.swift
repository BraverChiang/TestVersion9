//
//  FacialExpression.swift
//  Faceit
//
//  Created by Braver Chiang on 7/6/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import Foundation


//比较复杂的struct + 比较复杂的enum.
struct FacialExpression{
    enum Eyes: Int{
        case open
        case closed
        case squinting
    }
    
    enum Mouth: Int{
        case frown
        case smirk
        case neutral
        case grin
        case smile
        
        var sadder: Mouth{
            return Mouth(rawValue: rawValue-1) ?? .frown
        }
        
        var happier: Mouth{
            return Mouth(rawValue: rawValue + 1) ?? .smile
        }
    }
    
    var sadder: FacialExpression{
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.sadder)
    }
    
    var happier: FacialExpression{
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.happier)
    }
    
    let eyes: Eyes
    let mouth: Mouth
    
}
