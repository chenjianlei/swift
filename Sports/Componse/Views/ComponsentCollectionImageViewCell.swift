//
//  ComponsentCollectionImageViewCell.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class ComponsentCollectionImageViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeInitSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeInitSubviews() {
        contentView.addSubview(iconImageView)
    }
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView.init(frame: self.contentView.bounds)
        icon.backgroundColor = .red
        return icon
    }()
}
