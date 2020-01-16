//
//  SPMineTableViewCell.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class SPMineTableViewCell: UITableViewCell {
    
    private var _obj: ConfigCell?
    var obj: ConfigCell? {
        set {
            guard let o = newValue else {
                return
            }
            _obj = o
            
            if let icon = o.icon {
                imageView?.image = UIImage.init(named: icon)
            } else {
                imageView?.image = nil
            }
            
            titleLabel.text = o.title ?? ""
            accessoryType = o.accessoryType
        }
        get {
            return _obj
        }
    }

    lazy var iconImageView: UIImageView = {
        let i = UIImageView.init(frame: .zero)
        return i
    }()
    
    lazy var titleLabel: UILabel = {
        let t = UILabel.init(frame: .zero)
        t.font = UIFont.systemFont(ofSize: 14)
        t.textColor = .color_FFFFFF
        return t
    }()
    
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
        contentView.addSubview(titleLabel)
        makeInitLayout()
    }
    
    private func makeInitLayout() {
        iconImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.size.equalTo(CGSize.init(width: 20, height: 20))
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(iconImageView.snp.right).offset(16)
            make.right.equalToSuperview()
        }
    }

}
