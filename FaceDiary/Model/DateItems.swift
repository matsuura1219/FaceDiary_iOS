//
//  DateItems.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/26.
//

import Foundation

// インスタンス化の際に、日付を自動で取得するための構造体です

struct Request {
    
    var year: Int
    var month: Int
    var day: Int
    
    init() {
        let calendar = Calendar(identifier: .gregorian)
        let date = calendar.dateComponents([.year, .month, .day], from: Date())
        year = date.year!
        month = date.month!
        day = date.day!
    }
}
