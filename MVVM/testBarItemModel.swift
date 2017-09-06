//
//  testBarItemModel.swift
//  MVVM
//
//  Created by apple on 2017/9/4.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class testBarItemModel: NSObject {
    
    weak var targat:testBarItem?
    
    func click() -> Void {
        print("click")
        let vc = secondViewController()
        
        targat?.controllerTargat.navigationController?.pushViewController(vc, animated: true)
    }
}
