//
//  BaseViewController.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/15.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .color_353331
//        gk_navLeftBarButtonItem = returnItem
    }

//    lazy var returnItem: UIBarButtonItem = {
//        let button = UIButton.init(type: UIButton.ButtonType.custom)
//        button.setImage(UIImage.init(named: "nav_return_white"), for: .normal)
//        button.setImage(UIImage.init(named: "nav_return_white"), for: .highlighted)
//        button.frame = .init(x: 0, y: 0, width: 20, height: 20)
//        button.contentEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
//        button.addTarget(self, action: #selector(onActionReturn), for: .touchUpInside)
//        let item = UIBarButtonItem.init(customView: button)
//        return item
//    }()
//
//    func hideReturnButton() -> Void {
//        gk_navLeftBarButtonItem = nil
//    }
//
//    @objc func onActionReturn() {
//        navigationController?.popViewController(animated: true)
//    }
}
