//
//  SPHomeViewController.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/18.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class SPHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(onActionPush))
//        let nav = GlobalNavigatioBar.init("title")
//        nav.backgroundColor = UIColor.white
//        view.addSubview(nav)
        
//        nav.snp.makeConstraints { (make) in
//            make.left.equalToSuperview().offset(15)
//            make.right.equalToSuperview().offset(-15)
//            make.centerY.equalToSuperview()
//            make.height.equalTo(global_navigation_height)
//        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            let item = UINavigationItem.init(title: "this is one")
//            nav.pushItem(item, animated: true)
////            nav.alpha = 0
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                let item2 = UINavigationItem.init(title: "this is two")
//                nav.pushItem(item2, animated: true)
//
////                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
////                    nav.popItem(animated: true)
////                }
//            }
//        }
    }
    
    @objc func onActionPush() {
        let vc = BaseWMPageViewController.init()
        navigationController?.pushViewController(vc, animated: true)
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
////        let vc = BaseWMPageViewController.init(viewControllerClasses: [SPStoreViewController.self, UIViewController.self, UIViewController.self, UIViewController.self], andTheirTitles: ["跑步", "游泳", "爬山", "滑雪"])

//    }
}
