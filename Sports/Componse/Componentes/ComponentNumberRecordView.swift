//
//  ComponentNumberRecordView.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/17.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class ComponentNumberRecordView: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .color_353331
        makeInitSubviews()
        makeInitLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeInitSubviews() {
        contentView.addSubview(bgView)
        bgView.addSubview(recordKaView)
        bgView.addSubview(recordBuView)
    }
    
    private func makeInitLayout() {
        bgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalToSuperview()
        }
        
        recordKaView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.left.equalToSuperview()
        }
        
        recordBuView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.right.equalToSuperview()
        }
    }
    
    lazy var recordKaView: SPFriendRecordingView = {
        let rec = SPFriendRecordingView.init(des: "卡路里", icon: "")
        rec.backgroundColor = .color_35373B
        return rec
    }()
    
    lazy var recordBuView: SPFriendRecordingView = {
        let rec = SPFriendRecordingView.init(des: "步数", icon: "")
        rec.backgroundColor = .color_35373B
        return rec
    }()
    
    lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = .color_353331
        v.layer.cornerRadius = 16.0
        v.layer.masksToBounds = true
        return v
    }()
}
