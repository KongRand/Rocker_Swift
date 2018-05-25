//
//  ViewController.swift
//  rocker_swift
//
//  Created by user on 2018/5/25.
//  Copyright © 2018年 iwall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let actionBarView = ActionBarsView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        actionBarView.actionBar?.bDirection = {(dir:OperationOrder) in
            print(dir)
        }
        view.addSubview(actionBarView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

