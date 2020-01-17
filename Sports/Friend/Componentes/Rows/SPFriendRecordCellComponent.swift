//
//  SPFriendRecordCellComponent.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/17.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class SPFriendRecordCellComponent: M80TableViewCellComponent {
    
    override func height() -> CGFloat {
        return 75
    }
    
    override func cellClass() -> AnyClass {
        return ComponentNumberRecordView.self
    }
    
    override func configure(_ cell: UITableViewCell) {
        
    }
}
