//
//  SPMineViewController.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit
import SnapKit

let rote = CGFloat(375.0 / 169.0)
let bgHeight = global_screen_width / rote

class SPMineViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .color_F6F6F6
        makeIntiSettingConfig()
        makeInitSubviews()
        print("global_navigation_height -- \(global_navigation_height)")
    }
    
    private func makeIntiSettingConfig() {
        gk_navBarAlpha = 0
        gk_navTitleView = titleView
        gk_navLineHidden = true
    }
    
    private func makeInitSubviews() {
        view.addSubview(tableView)
        tableView.addSubview(headerView)
        makeInitLayout()
    }
    
    private func makeInitLayout() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let point = scrollView.contentOffset
        var alpha = 0.0
        if point.y < 0 {
            alpha = 0.0
        } else if (point.y > (bgHeight - global_navigation_height)) {
            alpha = 1.0
        } else {
            alpha = Double((point.y + 60) / CGFloat((bgHeight - global_navigation_height - 30)))
        }
        if point.y < -bgHeight {
            var rect = headerView.frame
            rect.origin.y = point.y
            rect.size.height = -point.y
            headerView.frame = rect
        }
        
        gk_navBarAlpha = CGFloat(alpha)
        titleView.alpha = CGFloat(alpha)
    }
    
    lazy var tableView: UITableView = {
        let t = UITableView.init(frame: .zero, style: .plain)
        t.dataSource = self
        t.delegate = self
        t.backgroundColor = .color_353331
        t.register(SPMineTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(SPMineTableViewCell.self))
        t.rowHeight = 50
        t.separatorStyle = .none
        t.contentInset = .init(top: bgHeight, left: 0, bottom: 0, right: 0)
        t.contentOffset = .init(x: 0, y: -bgHeight)
        return t
    }()
    
    lazy var headerView: SPMineHeaderBgView = {
        let i = SPMineHeaderBgView.init(frame: CGRect.init(x: 0, y: -bgHeight, width: global_screen_width, height: bgHeight))
        return i
    }()
    
    lazy var titleView: UILabel = {
        let t = UILabel.init(frame: CGRect.zero)
        t.textColor = .color_FFFFFF
        t.font = .systemFont(ofSize: 18)
        t.text = "this is name!"
        t.sizeToFit()
        t.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
        t.alpha = 0
        return t
    }()
    
    lazy var arrays: [ConfigCell] = {
        let arrs = [
            ConfigCell.init(icon: "mine_sport_record", title: "运动记录", accessoryType: .disclosureIndicator),
            ConfigCell.init(icon: "mine_record", title: "购买记录", accessoryType: .disclosureIndicator),
            ConfigCell.init(icon: "mine_history", title: "历史排行", accessoryType: .disclosureIndicator),
            ConfigCell.init(icon: "mine_xingzhuang", title: "运动计划", accessoryType: .disclosureIndicator),
            ConfigCell.init(icon: "mine_yaoqing", title: "邀请好友", accessoryType: .disclosureIndicator),
            ConfigCell.init(icon: "mine_about", title: "关于我们", accessoryType: .disclosureIndicator),
        ]
        return arrs
    }()
}

extension SPMineViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = BaseViewController()
        vc.view.backgroundColor = .color_353331
        vc.gk_navTitle = "tes"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SPMineViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SPMineTableViewCell.self), for: indexPath) as! SPMineTableViewCell
        cell.obj = arrays[indexPath.row]
        return cell
    }
}
