//
//  IntroPresenter.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/23.
//

import Foundation
import RxSwift

class IntroViewModel {
    var tmp:Float = 0.1
    var number : Observable<Float> = Observable<Float>.of(0.0)
    
    var nextPage : Observable<Bool> = Observable<Bool>.of(false)
    init(){
        
    }
    func fetchNumber(){
        var result = LotteryModel.init().getLottoData(drwNo: 354)
        if(!result){
            self.tmp = tmp + 0.1
            self.number = Observable<Float>.of(1.0)
        }
       
    }
    
    
    
}
