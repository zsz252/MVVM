//
//  testBarItem.swift
//  MVVM
//
//  Created by apple on 2017/9/4.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class testBarItem: UIBarButtonItem {
    
    var VM = testBarItemModel()
    var controllerTargat:ViewController!
    
    override func awakeFromNib() {
        VM.targat = self
        self.target = VM
        self.action = #selector(VM.click)
    }
}
