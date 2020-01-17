//
//  SPFriendStaisticsCellComponent.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/17.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class SPFriendStaisticsCellComponent: M80TableViewCellComponent {
    
    override func height() -> CGFloat {
        let rote = CGFloat((375 - 30) / 140)
        let height = CGFloat((global_screen_width - 30) / rote)
        return height
    }
    
    override func cellClass() -> AnyClass {
        return ComponentStatisticsView.self
    }
    
    override func configure(_ cell: UITableViewCell) {
        
    }
}
