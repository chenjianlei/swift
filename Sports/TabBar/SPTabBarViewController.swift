//
//  SPTabBarViewController.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class SPTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeSettingUI()
        viewControllers = makeViewControllers()
        selectedIndex = 1
    }

    private func makeSettingUI() {
        tabBar.isTranslucent = false
        tabBarItem.imageInsets = .init(top: 5, left: 0, bottom: -5, right: 0)
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = .color_353331
            appearance.shadowImage = UIImage()
            appearance.backgroundImage = UIImage()
            tabBar.standardAppearance = appearance
            tabBar.layer.borderWidth = 0.0
            tabBar.clipsToBounds = true
        } else {
//            let bgView = UIView()
//            bgView.backgroundColor = .color_353331
//            bgView.frame = tabBar.bounds
//            tabBar.insertSubview(bgView, at: 0)
            tabBar.backgroundColor = .color_353331
            tabBar.backgroundImage = UIImage()
            tabBar.shadowImage = UIImage()
        }
       
//        guard let subviews = tabBarController?.tabBar.subviews else {
//            return
//        }
//
//        for subview in subviews {
//            if subview.isKind(of: UIImageView.self) && view.bounds.size.height <= 1 {
//                subview.isHidden = true
//            }
//        }
    }
    
    private func makeTabBarSetting(_ child: SPNavigationViewController, norImage: String, selImage: String) {
//        child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.color_00D58E], for: .normal)
//        child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.color_00D58E], for: .selected)
        child.tabBarItem.image = UIImage.init(named: norImage)?.withRenderingMode(.alwaysOriginal)
        child.tabBarItem.selectedImage = UIImage.init(named: selImage)?.withRenderingMode(.alwaysOriginal)
    }
    
    private func makeChildNavigation(_ child: UIViewController) -> SPNavigationViewController {
        return SPNavigationViewController.init(rootViewController: child)
    }
    
    private func makeViewControllers() -> [SPNavigationViewController] {
        let homeVc = UIViewController()
        homeVc.navigationItem.title = "首页"
        let homeNav = makeChildNavigation(homeVc)
        homeNav.tabBarItem.title = ""
        makeTabBarSetting(homeNav, norImage: "tabbar_home_sel", selImage: "tabbar_home_sel")
        
        
        let friendVc = SPFriendViewController()
        let friednNav = makeChildNavigation(friendVc)
        friednNav.tabBarItem.title = ""
        makeTabBarSetting(friednNav, norImage: "tabbar_friend_nor", selImage: "tabbar_friend_sel")
        
        let storeVc = SPStoreViewController()
        storeVc.navigationItem.title = "商城"
        let storeNav = makeChildNavigation(storeVc)
        storeNav.tabBarItem.title = ""
        makeTabBarSetting(storeNav, norImage: "tabbar_store_nor", selImage: "tabbar_store_sel")
        
        let mineVc = SPMineViewController()
        mineVc.navigationItem.title = "我的"
        let mineNav = makeChildNavigation(mineVc)
        mineNav.tabBarItem.title = ""
        makeTabBarSetting(mineNav, norImage: "tabbar_mine_nor", selImage: "tabbar_mine_sel")
        
        return [homeNav, friednNav, storeNav, mineNav]
    }
}
