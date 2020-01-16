//
//  ComponentsMarginComponse.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class ComponentsMarginComponse: M80TableViewCellComponent, ComponseIndexProtocol {
 
    var index: Int = 0
    var customHeight: CGFloat
    var bgColor: UIColor
    
    init(height: CGFloat = 0, bg color: UIColor = UIColor.white) {
        self.customHeight = height
        self.bgColor = color
    }
    
    override func height() -> CGFloat {
        return customHeight
    }
    
    override func cellClass() -> AnyClass {
        return ComponsentMarginView.self
    }
    
    override func configure(_ cell: UITableViewCell) {
        cell.contentView.backgroundColor = bgColor
    }
    
}
