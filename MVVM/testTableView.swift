//
//  testTableView.swift
//  MVVM
//
//  Created by apple on 2017/9/4.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class testTableView: UITableView {
    
    var VM = testTableViewModel()

    override func awakeFromNib() {
        self.tableFooterView = UIView()
        
        // 自动适配cell高度
        self.estimatedRowHeight = 60
        self.rowHeight = UITableViewAutomaticDimension
        
        VM.target = self
        self.delegate = VM
        self.dataSource = VM
        // 下划分隔线偏移量设置为0
        //tableView.separatorInset = UIEdgeInsets.zero
    }
}
