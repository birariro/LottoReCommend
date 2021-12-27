//
//  IntroPresenter.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/23.
//

import Foundation
import RxSwift
protocol Observer{
    var value:Float{get}
    func update()
}

class IntroViewModel {
    let lottoModel = LottoModel.init()
    
    var tmp_value :Float = 0.0
    
    
    func validLottoData() -> Observable<Float>{
        return Observable.create{ obs in
            
            for inext in 1..<100{
                self.tmp_value += 0.1
                obs.onNext(self.tmp_value)
             sleep(1)
            }
          
            obs.onCompleted()
            return Disposables.create()
        }
     
    
      
       
    }
    
//    func validLottoData() -> Observable<Float>{
//        print("[k4keye] 시작")
//        return Observable.create{ obs in
//
//            print("[k4keye] 고")
//            obs.onNext(Float(0.2))
//            let allLottoEntity = self.lottoModel.getAllLottoEntity()
//            var currentKey = allLottoEntity.count + 1 //가장 마지막 인덱스가 회차이다.
//            print("[k4keye] 저장된 마지막 회차 : \(currentKey)")
//            while true {
//
//                let lottoEntity  = self.lottoModel.getLottoData(drwNo: currentKey)
//                if(lottoEntity.state){
//                    self.lottoModel.storeLottoEntity(data: lottoEntity)
//                    self.tmp_value += 0.1
//                    obs.onNext(self.tmp_value)
//
//                    currentKey += 1
//                }else{
//                    print("[k4keye] intro init 작업 완료 ")
//                    break
//                }
//            }
//            obs.onCompleted()
//            return Disposables.create()
//        }
//
//
//
//
//    }
    
//    func validLottoData() {
//
//        let allLottoEntity = lottoModel.getAllLottoEntity()
//        var currentKey = allLottoEntity.count + 1 //가장 마지막 인덱스가 회차이다.
//        print("[k4keye] 저장된 마지막 회차 : \(currentKey)")
//        while true {
//
//            let lottoEntity  = lottoModel.getLottoData(drwNo: currentKey)
//            if(lottoEntity.state){
//                lottoModel.storeLottoEntity(data: lottoEntity)
//                tmp_value += 0.1
//                self.progressValue = Observable.just(tmp_value)
//
//                currentKey += 1
//            }else{
//                print("[k4keye] intro init 작업 완료 ")
//                break
//            }
//        }
//
//        self.nextPage =  Observable<Bool>.of(true)
//
//    }
    
    
    
}
