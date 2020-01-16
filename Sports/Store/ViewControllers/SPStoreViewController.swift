//
//  SPStoreViewController.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit
import M80TableViewComponent

class SPStoreViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeInitConfig()
    }
    
    private func makeInitConfig() {
        let factory = StoreComponentFactory()
        factory.delegate = self
        tableViewComponent.sections = factory.sections
    }
    
    lazy var tableViewComponent: M80TableViewComponent = {
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .color_353331
        let t = M80TableViewComponent.init(tableView: self.tableView)
        let context = M80TableViewComponentContext()
        context.viewController = self
        t.context = context
        return t
    }()
}

extension SPStoreViewController: EventDelegate {
    
    func onEvent(_ obj: EventObj) {
        print("---- this is mian viewContoller")
        print(obj.params as Any)
    }
}
