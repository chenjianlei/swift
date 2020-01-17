//
//  SPFriendViewController.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/14.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit
import HGCircularSlider
import RxSwift
import Charts

class SPFriendViewController: UITableViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .color_353331
        navigationItem.title = "圈子"
        makeInitConfig()
//        makeInitSubviews()
//        makeInitLayout()
    }
    
    lazy var tableViewComponent: M80TableViewComponent = {
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .color_353331
        let t = M80TableViewComponent.init(tableView: self.tableView)
        let context = M80TableViewComponentContext()
        context.viewController = self
        t.context = context
        return t
    }()
    
    private func makeInitConfig() {
        let factory = FriendComponentsFactory()
        tableViewComponent.sections = factory.sections
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
    
    lazy var chartView: BarChartView = {
        let chart = BarChartView()
        chart.delegate = self
        chart.backgroundColor = .color_35373B
        chart.noDataText = "not data ~"
        chart.scaleXEnabled = false
        chart.scaleYEnabled = false
        chart.layer.cornerRadius = 5
        chart.layer.masksToBounds = true
        chart.chartDescription?.enabled = false
        chart.xAxis.axisLineWidth = 0 // X 轴线宽
        chart.xAxis.labelPosition = .top
        chart.xAxis.labelTextColor = .color_E7EEFC
        chart.leftAxis.axisLineWidth = 0 // Y 轴线宽
        chart.leftAxis.labelTextColor = .color_E7EEFC
        chart.xAxis.drawGridLinesEnabled = false
        chart.leftAxis.drawGridLinesEnabled = false
        chart.rightAxis.enabled = false
        chart.leftAxis.xOffset = 10
//        chart.maxVisibleCount = 0 // 不显示图形上的value值
        chart.legend.enabled = false
        chart.xAxis.labelFont = .systemFont(ofSize: 10)
        chart.leftAxis.labelFont = .systemFont(ofSize: 10)
        chart.xAxis.valueFormatter = ChartXFormText()
        chart.leftAxis.valueFormatter = ChartYLeftFormText()
        
        var yValue = [BarChartDataEntry]()
        for i in 0...6 {
            let y = Double(arc4random() % 70)
            let yEntry = BarChartDataEntry.init(x: Double(i + 1), y: y)
            yValue.append(yEntry)
        }
        
        let set1 = BarChartDataSet.init(entries: yValue, label: "")
        set1.axisDependency = .right
        set1.setColor(UIColor.color_5A5D65)
        set1.highlightColor = UIColor.color_5A5D65
        set1.valueTextColor = .color_E7EEFC

        
        let data = BarChartData.init(dataSet: set1)
        data.barWidth = 0.15
        chart.data = data
        
        chart.data?.notifyDataChanged()
        
        return chart
    }()
    
    private func makeInitSubviews() {
        view.addSubview(slider)
        slider.addSubview(iconImageView)
        view.addSubview(chartView)
        view.addSubview(recordKaView)
        view.addSubview(recordBuView)
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
    
    private func makeInitLayout() {
        slider.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            let rote = CGFloat(375 / 180)
            let size = CGFloat(global_screen_width / rote)
            make.width.height.equalTo(size)
            make.top.equalToSuperview().offset(40)
        }
        
        iconImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 40, height: 40))
            make.center.equalToSuperview()
        }
        
        chartView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            let rote = CGFloat((375 - 30) / 140)
            let height = CGFloat((global_screen_width - 30) / rote)
            make.height.equalTo(height)
        }
        
        recordKaView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.5).offset(-15)
            make.height.equalTo(75)
            make.left.equalTo(15)
            make.bottom.equalTo(chartView.snp.top).offset(-20)
        }
        
        recordBuView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.5).offset(-15)
            make.height.equalTo(75)
            make.right.equalTo(-15)
            make.bottom.equalTo(recordKaView)
        }
    }
    
    
    
//    private func test() {
//        Observable<Int>
//            .interval(.seconds(1), scheduler: MainScheduler.instance)
//            .subscribe { [weak self] (element) in
//                let time = CGFloat(element.element!)
//                let oldValue = self?.slider.endPointValue ?? 0.0
//                let newValue = CGFloat(time / 100.0 + oldValue)
//                self?.slider.endPointValue = newValue
//        }.disposed(by: disposeBag)
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        slider.endPointValue = 0.5
    }

}

extension SPFriendViewController: ChartViewDelegate {
    
}

class ChartXFormText: NSObject, IAxisValueFormatter {
    
    let suns = ["一", "二", "三", "四", "五", "六", "日"]
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return suns[Int(value) - 1]
    }
}

class ChartYLeftFormText: NSObject, IAxisValueFormatter {
    
     func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return "\(Int(value)) m"
     }
}
