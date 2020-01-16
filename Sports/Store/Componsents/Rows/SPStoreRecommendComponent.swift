//
//  SPStoreRecommendComponent.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit
import M80TableViewComponent

class SPStoreRecommendComponent: M80TableViewCellComponent, ComponseIndexProtocol {
    
    var delegate: EventDelegate?

    var index: Int = 0
    
    override func height() -> CGFloat {
        120
    }
    
    override func cellClass() -> AnyClass {
        return ComponsentLandscapeCollectionView.self
    }
    
    override func configure(_ cell: UITableViewCell) {
        let customCell = cell as! ComponsentLandscapeCollectionView
        customCell.delegate = delegate
    }
}
