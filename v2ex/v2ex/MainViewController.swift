//
//  MainViewController.swift
//  v2ex
//
//  Created by zz go on 2016/12/26.
//  Copyright © 2016年 zzgo. All rights reserved.
//

import Foundation
import RAMAnimatedTabBarController

class MainViewController: RAMAnimatedTabBarController {         
    override func viewDidLoad() {      
    super.viewDidLoad()       
    view.backgroundColor = UIColor.white          
    ///添加所有的子控制器     
//    addAllChildsControllors()                  
    }
    
}

//MARK: - UI

extension MainViewController {
    ///添加所有的子控制器
    fileprivate func addAllChildsControllors() {
        ///首页
        let homeVC = UIViewController()
        
        addOneChildVC(childVC: homeVC,
                        title: "首页", 
                        image: UIImage(),//UIImage(imageLiteralResourceName: "btn_home_normal"), 
                 selecteImage: UIImage(named: "btn_home_selected"))
        
        let liveVC = UIViewController()
        //直播
        addOneChildVC(childVC: liveVC,
                        title: "直播", 
                        image: UIImage(),//UIImage(imageLiteralResourceName: "btn_column_normal"), 
                 selecteImage: UIImage(named: "btn_column_selected"))
        
        let followVC=UIViewController()
        //关注 
        addOneChildVC(childVC: followVC, 
                        title: "关注", 
                        image: UIImage(),//UIImage(imageLiteralResourceName: "btn_live_normal"), 
                 selecteImage: UIImage(named: "btn_live_selected"))
        
        let profileVC=UIViewController()
        //我的
        addOneChildVC(childVC: profileVC, 
                        title: "我的",
                        image: UIImage(),//UIImage(imageLiteralResourceName: "btn_user_normal"), 
                 selecteImage: UIImage(named: "btn_user_selected"))
        
    }
    
    ///添加一个控制器
    private func addOneChildVC(childVC: UIViewController, title: String?, image: UIImage?, selecteImage: UIImage?) {
        
        //1.添加子控制器
        let navVC = UINavigationController(rootViewController: childVC)
        addChildViewController(navVC)
        //2.添加标题
        let item = RAMAnimatedTabBarItem(title: title, image: image, selectedImage: selecteImage)
        
//        let animation = RAMTransitionItemAnimations()//RAMTransitionItemAnimations()
//        animation.iconSelectedColor = UIColor.orange
//        animation.transitionOptions = UIViewAnimationOptions.transitionCurlUp
        item.animation = RAMBounceAnimation()
        
        
        navVC.tabBarItem = item
        
        
    }
}
