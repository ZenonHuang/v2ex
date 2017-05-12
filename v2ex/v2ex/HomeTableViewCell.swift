//
//  HomeTableViewCell.swift
//  v2ex
//
//  Created by zz go on 2017/5/12.
//  Copyright © 2017年 zzgo. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    var avatarImageView : UIImageView?
    var nicknameLabel : UILabel?
    var newsTitleLabel : UILabel?
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
    
    func configureCell(avatar: String,nickname: String,title: String,time :String,category :String) {
        self.nicknameLabel?.text=nickname
        self.newsTitleLabel?.text=title
        self.timeLabel?.text=time
//        self.categoryLabel
        self.avatarImageView?.image=UIImage(named: "twitter")
    }
    
    func addUI() {
        self.avatarImageView = UIImageView()
        self.contentView .addSubview(self.avatarImageView!)
        
        self.nicknameLabel = UILabel()
        self.contentView.addSubview(self.nicknameLabel!)
        
        self.newsTitleLabel = UILabel()
        self.contentView.addSubview(self.newsTitleLabel!)
        
        self.timeLabel = UILabel()
        self.contentView.addSubview(self.timeLabel!)
        
        self.categoryLabel = UILabel()
        self.contentView.addSubview(self.categoryLabel!)
    }
    
    func setupUI() {
        
        self.avatarImageView?.snp.makeConstraints({ (make) in
            make.top.left.equalTo(self.contentView)
            make.width.height.equalTo(50)
        })  
        
        self.nicknameLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.avatarImageView!)
            make.left.equalTo(self.avatarImageView!.snp.right).offset(10)
        })
        
        self.newsTitleLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.avatarImageView!.snp.bottom).offset(-10)
            make.left.equalTo(self.avatarImageView!).offset(0)
            make.right.equalTo(self.contentView).offset(-10)
            make.height.equalTo(50)
        })
    }
    
   
}
