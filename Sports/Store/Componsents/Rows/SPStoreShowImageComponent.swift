//
//  SPStoreShowImageComponent.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/14.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class SPStoreShowImageComponent: M80TableViewCellComponent, ComponseIndexProtocol {

    var index: Int = 0
    
    override func height() -> CGFloat {
        let maigin = CGFloat(375.0 - 345.0)
        let rote = CGFloat(343.0 / 143.0)
        let height = (global_screen_width - maigin) / rote
        return height
    }
    
    override func cellClass() -> AnyClass {
        return ComponsentShowImageListTableView.self
    }
    
    override func configure(_ cell: UITableViewCell) {
        
    }
}
