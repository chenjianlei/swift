//
//  SPFriendViewController.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/14.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class SPFriendViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .color_353331
        navigationItem.title = "圈子"
        makeInitConfig()
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
    
    private func makeInitConfig() {
        let factory = FriendComponentsFactory()
        tableViewComponent.sections = factory.sections
    }

}

