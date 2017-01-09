//
//  DetailsViewController.swift
//  v2ex
//
//  Created by zz go on 2017/1/4.
//  Copyright © 2017年 zzgo. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD
import SwiftyJSON
import SnapKit


class Details: NSObject {  //模型类
    var title:String?
    var content:String?
    
    // print时会调用。相当于java中的 toString()。为了代码整洁下面的模型去了这个计算属性。测试时请下载demo
//    override internal var description: String {  
//        return "name: \(name) \n icon:\(icon) \n"
//    }
}

class DetailsViewController: UIViewController {   
      var id: Int! 
    
      override func viewDidLoad() {      
        super.viewDidLoad()       
        
        self.navigationItem.title="详情"
        self.view.backgroundColor = UIColor.orange  
        
       
        
        //
        HUD.show(.progress, onView: self.view)
        
        // Optional Chainin
        if  let detailsID = self.id {
            //主题信息
            Alamofire.request("http://www.v2ex.com/api/topics/show.json?id=\(detailsID)").responseJSON { response in
                
                if let value = response.result.value {
                    let json = JSON(value)
                    print("details JSON id \(detailsID) \n \(json)")
                    if let obj = json.arrayObject?[0] {
                        
                        let title = JSON(obj)["title"].stringValue
                        print("dict \(title)")
                         self.setupTitle(text: title)
                    }
                
                }
                
             
                
                
                HUD.hide(animated: true)
            }
        }
       
        
        
 
    }
    
}

// Swift中类的扩展: Swift中的扩展相当于OC中的分类
//extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
//
//}

// Swift中类的扩展: Swift中的扩展相当于OC中的分类
extension DetailsViewController {
    
    func setupTitle(text:String?) {
    
        let titleLabel=UILabel.init()
        if let title=text {
            titleLabel.text=title
        }
    
        titleLabel.backgroundColor=UIColor.red
        self.view.addSubview(titleLabel)
                    
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(64)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(60)
        }
    }

}
