//
//  StatisticsViewModel.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/24.
//

import Foundation

class StatisticsViewModel {
    let lottoModel = LottoModel.init()
    
    func getCalculation(number:String) -> String{
        
        return "3%"
    }
    private func lottoTotal(){
        let allLottoEntity = lottoModel.getAllLottoEntity()
        let currentCount = allLottoEntity.count
        
        let calc = 3 / currentCount
        
    }
}
