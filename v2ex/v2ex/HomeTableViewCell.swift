//
//  HomeTableViewCell.swift
//  v2ex
//
//  Created by zz go on 2017/5/12.
//  Copyright © 2017年 zzgo. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    var avatarImageView : UIImageView?
    var nicknameLabel : UILabel?
    var newsTitleLabel : UILabel?
    var newsContentLabel : UILabel?
    var timeLabel : UILabel?
    var categoryLabel : UILabel?

    ///必须写
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addUI()
        self.setupUI()
    }
    
    func configureCell(avatar: String,nickname: String,title: String, content: String, time :String,category :String) {
        self.nicknameLabel?.text=nickname
        self.newsTitleLabel?.text=title
        self.newsContentLabel?.text=content
        self.timeLabel?.text=time
//        self.categoryLabel
        self.avatarImageView?.image=UIImage(named: "twitter")
        self.avatarImageView?.kf.setImage(with: NSURL(string : avatar) as? Resource, placeholder: UIImage(named: "twitter"), options: nil, progressBlock: nil, completionHandler: nil)

    }
    
    func addUI() {
        self.avatarImageView = UIImageView()
        self.contentView .addSubview(self.avatarImageView!)
        
        self.nicknameLabel = UILabel()
        self.contentView.addSubview(self.nicknameLabel!)
        
        self.newsTitleLabel = UILabel()
        self.newsTitleLabel?.font=UIFont.systemFont(ofSize: 15)
        self.newsTitleLabel?.numberOfLines=0
        self.contentView.addSubview(self.newsTitleLabel!)
        
        self.newsContentLabel = UILabel()
        self.newsContentLabel?.textColor=UIColor.gray
        self.newsContentLabel?.font=UIFont.systemFont(ofSize: 12)
        self.newsContentLabel?.numberOfLines=2
        self.contentView.addSubview(self.newsContentLabel!)
        
        
        self.timeLabel = UILabel()
        self.contentView.addSubview(self.timeLabel!)
        
        self.categoryLabel = UILabel()
        self.contentView.addSubview(self.categoryLabel!)
    }
    
    func setupUI() {
        
        self.avatarImageView?.snp.makeConstraints({ (make) in
            make.top.left.equalTo(self.contentView).offset(10)
            make.width.height.equalTo(30)
        })  
        
        self.nicknameLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.avatarImageView!)
            make.left.equalTo(self.avatarImageView!.snp.right).offset(10)
        })
        
        self.newsTitleLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.avatarImageView!.snp.bottom).offset(10)
            make.left.equalTo(self.avatarImageView!).offset(0)
            make.right.equalTo(self.contentView).offset(-10)
            make.height.equalTo(50)
        })
        
        self.newsContentLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.newsTitleLabel!.snp.bottom).offset(10)
            make.left.equalTo(self.avatarImageView!).offset(0)
            make.right.equalTo(self.contentView).offset(-10)
//            make.height.equalTo(50)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
        })
    }
    
   
}
