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
    var id : Int! 
    
    lazy var scrollView : UIScrollView = {
        return UIScrollView.init()
    }()

    
    lazy var titleLabel : UILabel = {
        let titleLabel=UILabel.init()
        titleLabel.backgroundColor=UIColor.groupTableViewBackground
        titleLabel.numberOfLines=0
        titleLabel.font=UIFont.systemFont(ofSize: 20)
        titleLabel.textAlignment =  NSTextAlignment.center
        return titleLabel
    }() 
    
    lazy var contentLabel : UILabel = {
        let label = UILabel.init()
        label.backgroundColor=UIColor.white
        label.numberOfLines=0
        return label
    }()
    
    
    
    override func viewDidLoad() {      
        super.viewDidLoad()       
        
        self.navigationItem.title="详情"
        self.view.backgroundColor = UIColor.white  

        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(0);
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }
 
        // Optional Chainin or Guard
        guard let detailsID = self.id else {
            return 
        }
                
        HUD.show(.progress, onView: self.view)
      
        //主题信息
        Alamofire.request("http://www.v2ex.com/api/topics/show.json?id=\(detailsID)").responseJSON { response in
            
            if let value = response.result.value {
                let json = Array(JSON(value))
                print("details JSON id \(detailsID) \n \(json)")
                if let obj = json.first {
                    let title = obj.1["title"].stringValue
                    let content = obj.1["content"].stringValue
                    print("dict \(title)")
                    self.setupTitle(text: title)
                    self.setupContent(text: content)
                }
            }
            
            HUD.hide(animated: true)
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
        
        if let title=text {
            self.titleLabel.text=title
        }
        
        self.scrollView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
//            make.centerX.equalToSuperview()
//            make.width.equalToSuperview()
            
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
    }
    
    func setupContent(text:String?) {
        
       
        if let text = text {
            self.contentLabel.text=text
        }
    
        self.scrollView.addSubview( self.contentLabel)
        
         self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(20)
//            make.centerX.equalToSuperview()
            make.left.right.equalTo(self.view)
//            make.width.equalToSuperview()
//            make.height.equalTo(60)
            make.bottom.equalToSuperview()
        }

    }

}
