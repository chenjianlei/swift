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
        contentView.layer.cornerRadius = 16.0
        contentView.layer.masksToBounds = true
        makeInitSubviews()
        makeInitLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeInitSubviews() {
        contentView.addSubview(recordKaView)
        contentView.addSubview(recordBuView)
    }
    
    private func makeInitLayout() {
        contentView.snp.makeConstraints { (make) in
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
}
