//
//  ComponsentShowImageListTableView.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/14.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class ComponsentShowImageListTableView: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .color_353331
        selectionStyle = .none
        makeInitSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeInitSubviews() {
        contentView.addSubview(iconImageView)
        makeInitLayout()
    }
    
    private func makeInitLayout() {
        iconImageView.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }
    }
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView.init(frame: CGRect.zero)
        icon.backgroundColor = .blue
        icon.layer.cornerRadius = 5
        icon.layer.masksToBounds = true
        return icon
    }()
}
