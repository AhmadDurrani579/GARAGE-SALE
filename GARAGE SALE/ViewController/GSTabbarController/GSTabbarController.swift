//
//  GSTabbarController.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 24/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit

class GSTabbarController: UITabBarController {
//    var selected_index: Int = 0
//    var tabBarArrow: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.items![0].selectedImage = UIImage(named:"home selected")!.withRenderingMode(.alwaysOriginal)
        (self.tabBar.items![0] ).image = UIImage(named:"home selected")!.withRenderingMode(.alwaysOriginal)
        
        self.tabBar.items![1].selectedImage = UIImage(named:"orders")!.withRenderingMode(.alwaysOriginal)
        (self.tabBar.items![1] ).image = UIImage(named:"orders")!.withRenderingMode(.alwaysOriginal)
        
        self.tabBar.items![2].selectedImage = UIImage(named:"upload")!.withRenderingMode(.alwaysOriginal)
        (self.tabBar.items![2] ).image = UIImage(named:"upload")!.withRenderingMode(.alwaysOriginal)
        
        self.tabBar.items![3].selectedImage = UIImage(named:"fav_icon")!.withRenderingMode(.alwaysOriginal)
        (self.tabBar.items![3] ).image = UIImage(named:"fav")!.withRenderingMode(.alwaysOriginal)
        
        
        self.tabBar.items![4].selectedImage = UIImage(named:"profile_selected")!.withRenderingMode(.alwaysOriginal)
        (self.tabBar.items![4] ).image = UIImage(named:"profile")!.withRenderingMode(.alwaysOriginal)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(GSTabbarController.badgeIconShow(_:)), name: NSNotification.Name(rawValue: KFavouriteBadge), object: nil)


    }
    @objc func badgeIconShow(_ notification: NSNotification) {
        let userData = notification.userInfo
        let countOfBadge = userData![AnyHashable(KFavouriteCount)]!
//        print(countOfBadge)
        self.tabBar.items![3].badgeColor = UIColor(red: 194/255.0, green: 194/255.0, blue: 194/255.0, alpha: 1.0)
        
        self.tabBar.items![3].badgeValue = countOfBadge as? String

        
    }

}
