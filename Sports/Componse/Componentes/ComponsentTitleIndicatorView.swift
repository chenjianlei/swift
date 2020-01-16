//
//  ComponsentTitleIndicatorView.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class ComponsentTitleIndicatorView: UITableViewCell {
    
    private var _title: String?
    var title: String? {
        set {
            _title = newValue
            titleLabel.text = newValue ?? ""
        }
        get {
            return _title
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .color_353331
        makeInitSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel: UILabel = {
        let t = UILabel.init(frame: .zero)
        t.font = .systemFont(ofSize: 16)
        t.textColor = .color_FFFFFF
        return t
    }()
    
    lazy var rightView: UIImageView = {
        let i = UIImageView.init(frame: CGRect.zero)
        i.backgroundColor = .red
        return i
    }()
    
    private func makeInitSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(rightView)
        makeInitLayout()
    }

    private func makeInitLayout() {
        rightView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 20, height: 20))
            make.right.equalTo(-16)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(15)
            make.right.lessThanOrEqualTo(rightView.snp.left)
        }
    }
}
