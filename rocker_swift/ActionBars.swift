//
//  ActionBars.swift
//  BlueCar
//
//  Created by user on 2018/5/18.
//  Copyright © 2018年 iwall. All rights reserved.
//

import UIKit

enum OperationOrder {
    case OUp
    case ODown
    case OLeft
    case ORight
    case OStop
}

typealias bDirection = (_ dir:OperationOrder) -> ()

class ActionBars: UIView {
    
    var tw: CGFloat = 0.0
    var th: CGFloat = 0.0
    
    var bDirection:bDirection!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        tw = (self.superview?.frame.size.width)! / 2
        th = (self.superview?.frame.size.height)! / 2
        if(touch != nil){
            let lastTouch = touch!.location(in: self.superview)

            var touchPoint = CGPoint(x: lastTouch.x, y: lastTouch.y)
            
            var angle = angleJudge(cpoint: CGPoint(x: touchPoint.x, y: touchPoint.y))

            touchPoint.y = max(tw - tw * abs(sin(abs(angle))), touchPoint.y);
            touchPoint.y = min(tw + tw * abs(sin(abs(angle))), touchPoint.y);
            touchPoint.x = max(tw - tw * abs(cos(abs(angle))), touchPoint.x);
            touchPoint.x = min(tw + tw * abs(cos(abs(angle))), touchPoint.x);
            
            angle = angle * 180 / .pi

            if (angle >= -45 && angle <= 45)
            {
                if(Int(touchPoint.x) > Int((self.superview?.frame.size.width)! / 2))
                {
                    bDirection(OperationOrder.ORight)
                }else{
                    bDirection(OperationOrder.OLeft)
                }
            }
            
            if ((angle > 45 && angle <= 90) || (angle < -45 && angle >= -90))
            {
                if(Int(touchPoint.y) > Int((self.superview?.frame.size.height)! / 2))
                {
                    bDirection(OperationOrder.ODown)
                }else{
                    bDirection(OperationOrder.OUp)
                }
            }
            
            UIView.animate(withDuration: 0.09999, animations: {
                self.center = touchPoint
            })
            self.setNeedsDisplay();
        }
    }
    
    
    /// 计算夹角
    ///
    /// - Parameter cpoint: 移动的角度
    /// - Returns: 返回计算出的角度结果
    func angleJudge(cpoint: CGPoint) -> CGFloat {
        
        let opoint = CGPoint(x: (self.superview?.frame.size.width)! / 2,
                             y: (self.superview?.frame.size.height)! / 2)
        let x1 = opoint.x - cpoint.x
        let y1 = opoint.y - cpoint.y
        
        let angle = atan(y1 / x1)
        
        return angle
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        center = CGPoint(x: (self.superview?.frame.size.width)! / 2,
                         y: (self.superview?.frame.size.height)! / 2)
        bDirection(OperationOrder.OStop)
    }

}
