//
//  SPFriendCycleCellComponent.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/17.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class SPFriendCycleCellComponent: M80TableViewCellComponent, ComponseIndexProtocol {

    var index: Int = 0
    
    override func height() -> CGFloat {
        let rote = CGFloat(375 / 180)
        let size = CGFloat(global_screen_width / rote)
        return size + 115
    }
    
    override func cellClass() -> AnyClass {
        return ComponentCycleRecordView.self
    }
    
    override func configure(_ cell: UITableViewCell) {
        
    }
}
