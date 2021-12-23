//
//  LotteryModel.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/23.
//

import Foundation
import Alamofire
import Alamofire_Synchronous
import SwiftyJSON
import RealmSwift

class LottoModel{
    
    let realm = try! Realm()
    
    func getLottoData(drwNo : Int) -> LottoNumEntity{
        let URL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drwNo)"
        let header : HTTPHeaders = [
            "Content-Type":"application/json",
            "charset":"utf-8"
        ]
        
        let lotteNumEntity  = LottoNumEntity()
        let response = Alamofire.request(URL, method: .get, encoding: JSONEncoding.default, headers: header).responseJSON()
        switch response.result {
            case .success(let value) :
                let resJson = JSON(value)
                
                
                let state = resJson["returnValue"]
                print("[k4keye] state \(state)")
                if(state == "success"){
                    lotteNumEntity.state = true
                    lotteNumEntity.drwNo = resJson["drwNo"].intValue
                    lotteNumEntity.drwtNo1 = resJson["drwtNo1"].intValue
                    lotteNumEntity.drwtNo2 = resJson["drwtNo2"].intValue
                    lotteNumEntity.drwtNo3 = resJson["drwtNo3"].intValue
                    lotteNumEntity.drwtNo4 = resJson["drwtNo4"].intValue
                    lotteNumEntity.drwtNo5 = resJson["drwtNo5"].intValue
                    lotteNumEntity.drwtNo6 = resJson["drwtNo6"].intValue
                }else{
                    lotteNumEntity.state = false
                }
                
                return lotteNumEntity
                
            case .failure(_):
                return lotteNumEntity
                
            @unknown default:
                return lotteNumEntity
            }
        
    }
    
    func storeLottoEntity(data : LottoNumEntity){
        do{
            try realm.write{ //Realm 을 Write로 열어서
                realm.add(data) //저장
            }
        } catch {
            
        }
    }
    
    func getAllLottoEntity() -> Results<LottoNumEntity>{
        return realm.objects(LottoNumEntity.self)
    }
}
