//
//  LotteNumModel.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/23.
//

import RealmSwift
class LottoNumEntity : Object {
    
    @objc dynamic var drwNo: Int = 0 //회차
    @objc dynamic var state: Bool = false //성공 여부
    @objc dynamic var drwtNo1: Int = 0
    @objc dynamic var drwtNo2: Int = 0
    @objc dynamic var drwtNo3: Int = 0
    @objc dynamic var drwtNo4: Int = 0
    @objc dynamic var drwtNo5: Int = 0
    @objc dynamic var drwtNo6: Int = 0
    
    override class func primaryKey() -> String? {
        return "drwNo"
    }
}
