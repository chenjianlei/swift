//
//  SPStoreBannerComponent.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit
import M80TableViewComponent

class SPStoreBannerComponent: M80TableViewCellComponent, ComponseIndexProtocol {
    
    var index: Int = 0

    override func height() -> CGFloat {
        let maigin = CGFloat(375.0 - 345.0)
        let rote = CGFloat(343.0 / 143.0)
        let height = (global_screen_width - maigin) / rote
        return height
    }
    
    override func cellClass() -> AnyClass {
        return ComponsentBannerView.self
    }
    
    override func configure(_ cell: UITableViewCell) {
        
    }
    
}
