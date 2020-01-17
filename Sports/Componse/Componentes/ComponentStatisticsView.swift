//
//  ComponentStatisticsView.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/17.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit
import Charts

class ComponentStatisticsView: UITableViewCell {

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
        contentView.addSubview(chartView)
    }
    
    private func makeInitLayout() {
        chartView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalToSuperview()
        }
    }
    
    lazy var chartView: BarChartView = {
        let chart = BarChartView()
        chart.backgroundColor = .color_35373B
        chart.noDataText = "not data ~"
        chart.scaleXEnabled = false
        chart.scaleYEnabled = false
        chart.layer.cornerRadius = 8
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
        return chart
    }()
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
