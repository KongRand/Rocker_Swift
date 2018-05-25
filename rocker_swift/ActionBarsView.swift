//
//  ActionBarsView.swift
//  BlueCar
//
//  Created by user on 2018/5/18.
//  Copyright © 2018年 iwall. All rights reserved.
//

import UIKit

class ActionBarsView: UIView {

    var actionBar:ActionBars?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let image = #imageLiteral(resourceName: "bg.png")
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0.0)
        image.draw(in:bounds)
        let nimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        backgroundColor = UIColor(patternImage: nimage!)

        actionBar = ActionBars.init(frame: CGRect(x: frame.size.width / 2 - frame.size.width / 8,
                                                  y: frame.size.height / 2 - frame.size.width / 8,
                                                  width: frame.size.width / 4,
                                                  height: frame.size.height / 4))
        actionBar?.layer.cornerRadius = (actionBar?.frame.width)! / 2
        actionBar?.clipsToBounds = true;
        addSubview(actionBar!)
    }
    
    override func layoutSubviews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
    }
}
