//
//  RAMBounceAnimation.swift
//  v2ex
//
//  Created by zz go on 2016/12/26.
//  Copyright © 2016年 zzgo. All rights reserved.
//

import Foundation
import RAMAnimatedTabBarController

class RAMBounceAnimation : RAMItemAnimation {
    
    var defaultImage : UIImage
    var seletedImage : UIImage
    
    init(selectedImage: UIImage,defaultImage: UIImage) {
      
        self.seletedImage=selectedImage
        self.defaultImage=defaultImage
        
        
        super.init()
    }
    
    override func playAnimation(_ icon: UIImageView, textLabel: UILabel) {
        //做动画
        playBounceAnimation(icon)
        
        textLabel.textColor = textSelectedColor
        icon.image=self.seletedImage
    }
    
    override func deselectAnimation(_ icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor) {
        textLabel.textColor = defaultTextColor
        icon.image=self.defaultImage
    }
    
    override func selectedState(_ icon: UIImageView, textLabel: UILabel) {
        textLabel.textColor = textSelectedColor
        
    }
    
    //动画函数
    func playBounceAnimation(_ icon : UIImageView) {
        
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(duration)
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        icon.layer.add(bounceAnimation, forKey: "bounceAnimation")
    }
}
