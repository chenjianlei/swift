//
//  ComponsentBannerView.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class ComponsentBannerView: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
