//
//  GlobalNavigatioBar.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/18.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class GlobalNavigatioBar: UIView {

    var title: String?
    init(_ title: String? = "") {
        self.title = title
        super.init(frame: CGRect.init(x: 0, y: 0, width: global_screen_width, height: global_navigation_height))
        makeInitSubviews()
        makeInitLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel: UILabel = {
        let t = UILabel.init(frame: CGRect.zero)
        t.font = .systemFont(ofSize: 18)
        t.textAlignment = .center
        t.textColor = .color_FFFFFF
        t.text = self.title
        return t
    }()
    
    private func makeInitSubviews() {
        addSubview(titleLabel)
    }
    
    private func makeInitLayout() {
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(44)
        }
    }
}

