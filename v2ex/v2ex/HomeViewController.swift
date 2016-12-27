//
//  HomeViewController.swift
//  v2ex
//
//  Created by zz go on 2016/12/27.
//  Copyright © 2016年 zzgo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController {         
    override func viewDidLoad() {      
        super.viewDidLoad()       
        view.backgroundColor = UIColor.orange          
        //最热主题 相当于首页右侧的 10 大每天的内容。
        Alamofire.request("https://www.v2ex.com/api/topics/hot.json").responseJSON { response in

            let json = JSON(response.result.value as Any)
            //转为数组
            let arr = json.arrayObject 
            for (index, value) in (arr?.enumerated())! {
//                print("test swiftyJSON \(index): \(value)")
                let itemObj = JSON(value)
                let title = itemObj["title"].stringValue
                print("test swiftyJSON \(index): \(title)")
            }
            
            
            
        }
    }
    
}
