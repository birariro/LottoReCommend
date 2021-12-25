//
//  ChartViewController.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/25.
//

import Foundation
import UIKit
import Charts

class ChartViewController : UIViewController,ChartViewDelegate{
    

    @IBOutlet weak var pieChartView: PieChartView!

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChartView.noDataText = "데이터가 없습니다."
        pieChartView.noDataFont = .systemFont(ofSize: 20)
        pieChartView.noDataTextColor = .lightGray
        setChartData()
       
    }
    
    func setChartData(){

        var entries = [PieChartDataEntry]()

        for x in 0..<10 {
            
            let entry = PieChartDataEntry()
            entry.value = Double(x)
            entry.label = "hello"
            
            entries.append(entry)

        }


        let dataSet = PieChartDataSet(entries: entries, label: "자주 나온 번호")
        dataSet.colors = ChartColorTemplates.joyful()


        let data = PieChartData(dataSet: dataSet)


        pieChartView.data = data
        //애니메이션 적용
        pieChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }

   
}
