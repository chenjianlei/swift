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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeInitSubviews() {
        
    }
    
    private func makeInitLayout() {
        
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
