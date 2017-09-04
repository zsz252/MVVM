//
//  testTableViewModel.swift
//  MVVM
//
//  Created by apple on 2017/9/4.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class testTableViewModel: NSObject,UITableViewDelegate,UITableViewDataSource {

    var target:testTableView!
    
    let testValue:NSString = "这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n"
    
    var dict:Dictionary<String,String> = [:]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.row%2 == 0{
            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let label = cell.contentView.viewWithTag(1000) as! UILabel
            label.text = testValue as String
            
            if dict[String(indexPath.row)] == "0"{
                label.numberOfLines = 0
            }else{
                label.numberOfLines = 1
            }
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row%2 == 0{
            let cell = tableView.cellForRow(at: indexPath)
            let label = cell?.contentView.viewWithTag(1000) as! UILabel
            // beginUpadata endUpdata 之间的代码帧动画刷新
            tableView.beginUpdates()
            if label.numberOfLines == 0{
                label.numberOfLines = 1
                dict[String(indexPath.row)] = "1"
            }else{
                label.numberOfLines = 0
                dict[String(indexPath.row)] = "0"
            }
            tableView.endUpdates()
            //tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row%2 == 1{
            return 250
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
    }
    
    //视觉差异滑动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in self.target.visibleCells{
            //            print(cell.reuseIdentifier)
            if cell.reuseIdentifier == "imageCell"{
                let bottomView = cell.contentView.viewWithTag(2000)
                let image = bottomView?.viewWithTag(2001)
                let rect = bottomView?.convert((bottomView?.bounds)!, from: nil)
                var Y = UIScreen.main.bounds.size.height + (rect?.origin.y)! - 400
                Y*=0.4
                if Y > 0{
                    Y = 0
                }
                if Y < -150{
                    Y = -150
                }
                print(UIScreen.main.bounds.size.height)
                print(rect?.origin.y)
                print(Y)
                image?.frame.origin.y = Y
            }
        }
    }

}
