//
//  BaseWMPageViewController.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/18.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class BaseWMPageViewController: WMPageController {

    init() {
        super.init(nibName: nil, bundle: nil)
        makeInitConfig()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .color_353331
    }
    
    private func makeInitConfig() {
        self.navigationItem.title = "WMPage"
        self.showOnNavigationBar = true
        self.menuView?.backgroundColor = .color_353331
        self.scrollView?.backgroundColor = .color_353331
        self.titleSizeNormal = 14
        self.titleSizeSelected = 17
        self.titleColorNormal = .color_707070
        self.titleColorSelected = .color_FFFFFF
        self.menuViewStyle = .line
        self.menuViewLayoutMode = .left
        self.automaticallyCalculatesItemWidths = true
        self.progressWidth = 10
        self.progressViewIsNaughty = true
        self.itemMargin = 15
    }
}

extension BaseWMPageViewController {
    
    override func numbersOfChildControllers(in pageController: WMPageController) -> Int {
        arrays.count
    }

    override func pageController(_ pageController: WMPageController, titleAt index: Int) -> String {
        return arrays[index]
    }

    override func pageController(_ pageController: WMPageController, viewControllerAt index: Int) -> UIViewController {
            let vc = UIViewController()
            if index == 0 {
                let v = SPStoreViewController()
                return v
            } else if index == 1 {
                vc.view.backgroundColor = .red
            } else if index == 2 {
                vc.view.backgroundColor = .blue
            } else {
                vc.view.backgroundColor = .black
            }
            return vc
    }
    
    override func pageController(_ pageController: WMPageController, preferredFrameFor menuView: WMMenuView) -> CGRect {
            let y: CGFloat = showOnNavigationBar ? 0 : 0
            let m: CGFloat = showOnNavigationBar ? margin : 0
            let rect = CGRect.init(x: m, y: y, width: global_screen_width - m * 2, height: menuHeight)
            return rect
    }
    
    override func pageController(_ pageController: WMPageController, preferredFrameForContentView contentView: WMScrollView) -> CGRect {
            var tabBarHeight:CGFloat = 0
            if let tabBar = self.tabBarController?.tabBar {
                tabBarHeight = !tabBar.isHidden && navigationController?.viewControllers.count == 0 ? tabBar.frame.height : 0
            }
            let maxY: CGFloat = showOnNavigationBar ? 0 : menuHeight
            return CGRect.init(x: 0, y: maxY, width: global_screen_width, height: global_screen_height - global_navigation_height - tabBarHeight - maxY)
    }
}

let margin: CGFloat = 50
let menuHeight: CGFloat = 44
let arrays = ["跑步", "游泳", "爬山", "滑雪"]
