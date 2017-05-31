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
    addAllChildsControllors()                  
    }
}

//MARK: - UI
extension MainViewController {
    ///添加所有的子控制器
    fileprivate func addAllChildsControllors() {
        ///首页
        let discoverVC = DiscoverViewController() //HomeViewController()
        
        addOneChildVC(childVC: discoverVC,
                        title: "发现", 
                        image: UIImage(named: "tabbar_hot"),//UIImage(imageLiteralResourceName: "btn_home_normal"), 
                 selecteImage: UIImage(named: "tabbar_hot_selected"))
        
        let profileVC = ProfileViewController()
        //我的
        addOneChildVC(childVC: profileVC, 
                        title: "我的",
                        image: UIImage(named: "tabbar_profile"),
                 selecteImage: UIImage(named: "tabbar_profile_selected"))
        
    }
    
    private func addOneChildVC(childVC: UIViewController, title: String?, image: UIImage?, selecteImage: UIImage?) {
        
        //添加标题 ps:selectedImage是没有效果的
        let item = RAMAnimatedTabBarItem(title: title, image: image, selectedImage: selecteImage)
        item.textColor = UIColor.init(colorLiteralRed: 219/255, green: 219/255, blue: 219/155, alpha: 1)
        item.selectedImage = selecteImage
//        let animation = RAMTransitionItemAnimations()//RAMTransitionItemAnimations()
//        animation.iconSelectedColor = UIColor.orange
//        animation.transitionOptions = UIViewAnimationOptions.transitionCurlUp
        
        //自定义的animation
        let animation = RAMBounceAnimation(selectedImage: selecteImage!,defaultImage: image!)
        animation.textSelectedColor=UIColor.init(colorLiteralRed: 39/255, green: 39/255, blue: 39/255, alpha: 1)
        
        item.animation = animation

        //添加子控制器
        let navVC = UINavigationController(rootViewController: childVC)
        addChildViewController(navVC)
        navVC.tabBarItem = item
        
        
    }
}
