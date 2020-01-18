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

class SPMineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeIntiSettingConfig()
        makeInitSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func makeIntiSettingConfig() {
        fd_prefersNavigationBarHidden = true
    }
    
    private func makeInitSubviews() {
        
        view.addSubview(tableView)
        tableView.addSubview(headerView)
        view.addSubview(navigationView)
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
        
        navigationView.alpha = CGFloat(alpha)
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
    
    lazy var navigationView: GlobalNavigatioBar = {
        let n = GlobalNavigatioBar.init("this is title")
        n.alpha = 0
        n.backgroundColor = .color_353331
        return n
    }()
}

extension SPMineViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var vc: UIViewController?
        if indexPath.row == 0 {
            vc = SPMineSportRecordViewController()
//            let nav = UINavigationController.init(rootViewController: vc!)
//            navigationController?.pushViewController(nav, animated: true)
//            return
        }
        
        
        guard let controller = vc else {
            return
        }
        navigationController?.pushViewController(controller, animated: true)
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
