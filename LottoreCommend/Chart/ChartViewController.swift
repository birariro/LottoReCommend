//
//  ChartViewController.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/25.
//

import Foundation
import UIKit
import Charts
import RealmSwift

class ChartViewController : UIViewController,ChartViewDelegate{
    
    //높은 통계
    @IBOutlet weak var pieChartView: PieChartView!
    //낮은 통계
    @IBOutlet weak var lowPieChartView: PieChartView!
    //최신 회차
    @IBOutlet weak var lastLabel: UILabel!
    
    var index = 0
    let maxIndex = 10
    var total = 0
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lottoModel = LottoModel.init()
        let allLottoEntity = lottoModel.getAllLottoEntity()
        let lottoData = initLottoData(allLottoEntity: allLottoEntity)
        lastLabel.text = "최신 회차 : \(allLottoEntity.count)"
        total = allLottoEntity.count
        

        pieChartView.noDataText = "데이터가 없습니다."
        pieChartView.noDataFont = .systemFont(ofSize: 20)
        pieChartView.noDataTextColor = .lightGray
        //큰값 차트
        setChartData(chartView: pieChartView, lottoData: lottoData, isTop: true)
        
        index = 0 //초기화
        lowPieChartView.noDataText = "데이터가 없습니다."
        lowPieChartView.noDataFont = .systemFont(ofSize: 20)
        lowPieChartView.noDataTextColor = .lightGray
        
        //작은값 차트
        setChartData(chartView: lowPieChartView, lottoData: lottoData, isTop: false)
       
    }
    
    private func getCalculation(index:Int, isTop:Bool ,total:Int, target:Int) -> Float{
        //크기 차이를 주기위해 index까지 연산
        //큰 순서는 뒤로갈수록 작아지게
        if(isTop){
            return ((Float(target) / Float(total)) * 100) + (10-Float(index))
        }
        //작은 순서는 뒤로 갈수록 커지게
        return ((Float(target) / Float(total)) * 100) + Float(index)
       
    }
    
    func setChartData(chartView: PieChartView, lottoData : Dictionary<Int, Int>, isTop:Bool){

      
        var entries = [PieChartDataEntry]()
        
        var chartData = lottoData.sorted{ $0.1 > $1.1}
        
        if(isTop == false){
            chartData = lottoData.sorted{ $1.0 > $0.1}
        }
        
        for (key , value) in chartData {
            print("[k4keye] key  : \(key) , value : \(value)")
            let entry = PieChartDataEntry()
            
            
            entry.label = String(key) + " 번"
            let calc_value = Double(getCalculation(index: index , isTop:isTop ,total: total, target: value)) //퍼센트
            entry.value = calc_value
            
            
            entries.append(entry)

            
            index += 1
            if(index >= maxIndex){
                break
            }
        }
        

        
        let dataSet = PieChartDataSet(entries: entries, label: "순서 입니다.")
        dataSet.drawValuesEnabled = false
        
        dataSet.colors = ChartColorTemplates.vordiplom()
        if(isTop == false){
            dataSet.colors = ChartColorTemplates.liberty()
        }
        let data = PieChartData(dataSet: dataSet)

        chartView.data = data
        //애니메이션 적용
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
    }
    
    
    private func initLottoData(allLottoEntity : Results<LottoNumEntity> ) -> Dictionary<Int,Int>{
     
     
        //init
        var data:Dictionary<Int,Int> = [:]
        for index in 1..<46 {
            data[index] = 0
        }
        print("[k4keye] data : \(data)")
        
        //set
        for lottoEntity in allLottoEntity {
            data[lottoEntity.drwtNo1] = data[lottoEntity.drwtNo1]! + 1
            data[lottoEntity.drwtNo2] = data[lottoEntity.drwtNo2]! + 1
            data[lottoEntity.drwtNo3] = data[lottoEntity.drwtNo3]! + 1
            data[lottoEntity.drwtNo4] = data[lottoEntity.drwtNo4]! + 1
            data[lottoEntity.drwtNo5] = data[lottoEntity.drwtNo5]! + 1
            data[lottoEntity.drwtNo6] = data[lottoEntity.drwtNo6]! + 1
        }
        print("[k4keye] set data : \(data)")
        
        return data
    }
    
 
    

   
}
