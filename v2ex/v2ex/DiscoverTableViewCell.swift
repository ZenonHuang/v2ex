//
//  DiscoverTableViewCell.swift
//  v2ex
//
//  Created by zz go on 2017/5/31.
//  Copyright © 2017年 zzgo. All rights reserved.
//

import UIKit
import Kingfisher

class DiscoverTableViewCell: UITableViewCell {
    var avatarImageView : UIImageView?
   
    var newsTitleLabel : UILabel?

    
    ///必须写
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addUI()
        self.setupUI()
    }
    
    func configureCell(title: String, imgUrlString :String) {

        self.newsTitleLabel?.text=title
        
        let num = imgUrlString.characters.count
        
        if  num<1 {
            return
        }
        
        let resource = ImageResource.init(downloadURL:URL(string :imgUrlString)!)
        self.avatarImageView?.kf.setImage(with: resource, placeholder: UIImage(named: "twitter"))
        
    }
    
    func addUI() {
        self.avatarImageView = UIImageView()
        self.contentView .addSubview(self.avatarImageView!)
        
                
        self.newsTitleLabel = UILabel()
        self.newsTitleLabel?.font=UIFont.systemFont(ofSize: 15)
        self.newsTitleLabel?.numberOfLines=0
        self.contentView.addSubview(self.newsTitleLabel!)
        
        
    }
    
    func setupUI() {
        
        self.avatarImageView?.snp.makeConstraints({ (make) in
            make.top.left.equalTo(self.contentView).offset(10)
            make.right.bottom.equalTo(-10)
        })  
        
   
        
        self.newsTitleLabel?.snp.makeConstraints({ (make) in
            make.center.equalTo(self.contentView)
            make.height.equalTo(50)
        })
        
        
    }
    
    
}

