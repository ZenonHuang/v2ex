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

class DetailsViewController: UIViewController {   
      var id: Int? 
    
      override func viewDidLoad() {      
        super.viewDidLoad()       
        view.backgroundColor = UIColor.orange          
        //
        HUD.show(.progress, onView: self.view)
        
        let detailsID = self.id
        
        //主题信息
        Alamofire.request("http://www.v2ex.com/api/topics/show.json?id=\(detailsID)").responseJSON { response in
            
            let json = JSON(response.result.value as Any)
            print("details JSON id \(detailsID) \n \(json)")
            
            HUD.hide(animated: true)
        }
 
    }
    
}

// Swift中类的扩展: Swift中的扩展相当于OC中的分类
//extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
//
//}
