//
//  SPStoreTitleIndicatorComponent.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit
import M80TableViewComponent

class SPStoreTitleIndicatorComponent: M80TableViewCellComponent, ComponseIndexProtocol {

    var index: Int = 0
    var title: String = ""
    
    init(_ title: String) {
        self.title = title
    }
    
    override func height() -> CGFloat {
        44
    }
    
    override func cellClass() -> AnyClass {
        return ComponsentTitleIndicatorView.self
    }
    
    override func configure(_ cell: UITableViewCell) {
        let customCell = cell as! ComponsentTitleIndicatorView
        customCell.selectionStyle = .none
        customCell.title = title
    }
}
