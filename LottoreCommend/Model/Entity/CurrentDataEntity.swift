//
//  CurrentDataModel.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/23.
//

import Foundation
import RealmSwift
//가장 마지막에 호출한 API number를 기록한다.
class CurrentDataEntity : Object {
    @objc dynamic var currentNumber: Int = 0
 
}
