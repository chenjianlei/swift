//
//  SPFriendRecordingView.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/17.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class SPFriendRecordingView: UIView {

    var des: String?
    var icon: String?
    
    init(des: String? = "未知", icon: String) {
        super.init(frame: .zero)
        self.des = des
        self.icon = icon
        self.makeInitSubviews()
        self.makeInitLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.backgroundColor = .red
        return icon
    }()
    
    lazy var numberLael: UILabel = {
        let b = UILabel.init(frame: CGRect.zero)
        b.text = "220"
        b.font = .systemFont(ofSize: 18)
        b.textColor = .color_E7EEFC
        return b
    }()
    
    lazy var desLabel: UILabel = {
        let des = UILabel.init(frame: .zero)
        des.text = self.des
        des.font = .systemFont(ofSize: 12)
        des.textAlignment = .center
        des.textColor = .color_E7EEFC
        return des
    }()
    
    private func makeInitSubviews() {
        addSubview(iconImageView)
        addSubview(numberLael)
        addSubview(desLabel)
    }
    
    private func makeInitLayout() {
        iconImageView.snp.makeConstraints { (make) in
            make.right.equalTo(snp.centerX).offset(-5)
            make.size.equalTo(CGSize.init(width: 20, height: 20))
            make.bottom.equalTo(snp.centerY).offset(-5)
        }
        
        numberLael.snp.makeConstraints { (make) in
            make.left.equalTo(snp.centerX).offset(5)
            make.right.lessThanOrEqualTo(snp.right)
            make.height.equalTo(20)
            make.centerY.equalTo(iconImageView)
        }
        
        desLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(14)
            make.top.equalTo(snp.centerY).offset(5)
        }
    }
}
