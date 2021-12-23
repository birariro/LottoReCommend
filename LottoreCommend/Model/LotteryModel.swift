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

class LotteryModel{
    
    func getLottoData(drwNo : Int) -> Bool{
        let URL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drwNo)"
        let header : HTTPHeaders = [
            "Content-Type":"application/json",
            "charset":"utf-8"
        ]
        
        let response = Alamofire.request(URL, method: .get, encoding: JSONEncoding.default, headers: header).responseJSON()
        switch response.result {
        case .success(let value) :
            let resJson = JSON(value)
            print("[k4keye] all \(resJson)")
//            print("[k4keye] totSellamnt \(resJson["totSellamnt"])")
//            print("[k4keye] drwtNo1 \(resJson["drwtNo1"])")
//            print("[k4keye] drwtNo2 \(resJson["drwtNo2"])")
//            print("[k4keye] drwtNo3 \(resJson["drwtNo3"])")
//            print("[k4keye] drwtNo4 \(resJson["drwtNo4"])")
//            print("[k4keye] drwtNo5 \(resJson["drwtNo5"])")
//            print("[k4keye] drwtNo6 \(resJson["drwtNo6"])")
            return true
        case .failure(let error) :
            print("BLOCKCHAIN_GET_API_URL Error : \(error)")
        }
        return false
        
    }
    
    func getCurrentData() -> Int{
        return 0
    }
}
