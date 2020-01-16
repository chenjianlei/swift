//
//  SPMineHeaderView.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/16.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class SPMineHeaderBgView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImage.init(named: "mine_top_bg")
        clipsToBounds = true
        makeInitSubviews()
        makeInitLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var userInfoView: SPMineHeaderInfoView = {
        let v = SPMineHeaderInfoView()
        return v
    }()
    
    private func makeInitSubviews() {
        addSubview(userInfoView)
    }
    
    private func makeInitLayout() {
        userInfoView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}

class SPMineHeaderInfoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeInitSubviews()
        makeInitLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var avatarImageView: UIImageView = {
       let avatar = UIImageView()
        avatar.backgroundColor = .red
        avatar.layer.cornerRadius = 30
        avatar.layer.masksToBounds = true
        return avatar
    }()
    
    lazy var nameLabel: UILabel = {
        let n = UILabel()
        n.font = .systemFont(ofSize: 16)
        n.textColor = .color_353331
        n.text = "this is name"
        return n
    }()
    
    lazy var desLabel: UILabel = {
        let d = UILabel()
        d.font = .systemFont(ofSize: 12)
        d.textColor = .color_353331
        d.text = "this is desc!"
        return d
    }()
    
    private func makeInitSubviews() {
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(desLabel)
    }
    
    private func makeInitLayout() {
        avatarImageView.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 60, height: 60))
            make.left.equalTo(20)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.height.equalTo(18)
            make.left.equalTo(avatarImageView.snp.right).offset(20)
            make.right.lessThanOrEqualToSuperview()
            make.bottom.equalTo(avatarImageView.snp.centerY).offset(-3)
        }
        
        desLabel.snp.makeConstraints { (make) in
            make.height.equalTo(14)
            make.left.right.equalTo(nameLabel)
            make.top.equalTo(avatarImageView.snp.centerY).offset(3)
        }
    }
}
