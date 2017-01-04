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
import PKHUD

class HomeViewController: UIViewController {   
    
    // MARK:- 属性
    let cellID = "tableViewCellID"
    var dataArray = Array<Any>() ;
    
    override func viewDidLoad() {      
        super.viewDidLoad()       
        view.backgroundColor = UIColor.orange          
               
        let size=self.view.frame.size;
        
        // 1.创建tableView,并添加的控制器的view
        let tableView = UITableView(frame: CGRect.init(x: 0, y: 22, width: size.width, height: size.height))
        
        // 2.设置数据源代理
        tableView.dataSource = self
        tableView.delegate = self
        
        // 3.添加到控制器的view
        view.addSubview(tableView)
        
        // 4.注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        HUD.show(.progress, onView: self.view)
       
        //最热主题 相当于首页右侧的 10 大每天的内容。
        Alamofire.request("https://www.v2ex.com/api/topics/hot.json").responseJSON { response in
            
            let json = JSON(response.result.value as Any)
            //转为数组
            self.dataArray = json.arrayObject! 
            for (index, value) in (self.dataArray.enumerated()) {
                //                print("test swiftyJSON \(index): \(value)")
                let itemObj = JSON(value)
                let title = itemObj["title"].stringValue
                print("test swiftyJSON \(index): \(title)\n \(itemObj)")
            }
            tableView.reloadData()
            HUD.hide(animated: true)
        }

        
        
    }
    
}

// Swift中类的扩展: Swift中的扩展相当于OC中的分类
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK:- UITableViewDataSource数据源
    // 必须实现UITableViewDataSource的option修饰的必须实现的方法,否则会报错
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*
         // ----------------------------------------------------------------
         // 使用普通方式创建cell
         let cellID = "cell"
         
         // 1.创建cell,此时cell是可选类型
         var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
         
         // 2.判断cell是否为nil
         if cell == nil {
         cell = UITableViewCell(style: .Default, reuseIdentifier: cellID)
         }
         
         // 3.设置cell数据
         cell?.textLabel?.text = "测试数据\(indexPath.row)"
         
         return cell!
         */
        
        
        let data=self.dataArray[indexPath.row]
        let itemObj = JSON(data)
        let title = itemObj["title"].stringValue
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        cell?.textLabel?.text = "\(indexPath.row) \(title)"
        
        return cell!
        
    }
    
    // MARK:- UITableViewDelegate代理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC=DetailsViewController()
        let data=self.dataArray[indexPath.row]
        let itemObj = JSON(data)
        detailsVC.id=itemObj["id"].int
        self.navigationController?.show(detailsVC, sender: self)
         print("点击了\(indexPath.row)")
    }
}
