//
//  ComponentCycleRecordView.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/17.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit
import HGCircularSlider

class ComponentCycleRecordView: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = .color_353331
        makeInitSubviews()
        makeInitLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeInitSubviews() {
        contentView.addSubview(slider)
        slider.addSubview(iconImageView)
        contentView.addSubview(desLabel)
        contentView.addSubview(timeLabel)
    }
    
    private func makeInitLayout() {
        timeLabel.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(32)
        }
        
        desLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(20)
            make.bottom.equalTo(timeLabel.snp.top).offset(-10)
        }
        
        slider.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView.snp.centerX)
            let rote = CGFloat(375 / 180)
            let size = CGFloat(global_screen_width / rote)
            make.width.height.equalTo(size)
            make.bottom.equalTo(desLabel.snp.top).offset(-10)
        }
        
        iconImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 40, height: 40))
            make.center.equalToSuperview()
        }
    }

    lazy var slider: CircularSlider = {
        let s = CircularSlider()
        s.backgroundColor = .color_353331
        s.diskFillColor = .color_353331
        s.diskColor = .color_353331
        s.trackColor = .color_F6F6F6
        s.trackFillColor = .color_00D58E
        s.minimumValue = 0.0
        s.maximumValue = 1.0
        s.endPointValue = 0.0
        s.endThumbTintColor = .color_00D58E
        s.endThumbStrokeHighlightedColor = .color_00D58E
        s.endThumbStrokeColor = .color_00D58E
        s.thumbRadius = 2.0
        s.isEnabled = false
        return s
    }()
    
    lazy var iconImageView: UIImageView = {
        let i = UIImageView()
        i.backgroundColor = .red
        return i
    }()
    
    lazy var desLabel: UILabel = {
        let des = UILabel()
        des.text = "用时"
        des.textColor = .color_E7EEFC
        des.font = .systemFont(ofSize: 18)
        des.textAlignment = .center
        return des
    }()
    
    lazy var timeLabel: UILabel = {
        let t = UILabel()
        t.text = "00:00:02"
        t.textColor = .color_E7EEFC
        t.textAlignment = .center
        t.font = .systemFont(ofSize: 30)
        return t
    }()
}
