//
//  DateManager.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/23.
//

import Foundation

class DateManager {
    
    
    // 現在の日付を「YYYYY年MM月」で取得する関数です
    static func getCurrentDate () -> String {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMM", options: 0, locale: Locale(identifier: "ja_JP"))
      
        return dateFormatter.string(from: date)
    }
    
    
    // 次の月を「YYYYY年M月」で取得する関数です
    static func getNextDate (date: String) -> String {

        // 年
        var year: Int = Int(String(date.prefix(4))) ?? 1990
        
        //月
        // 5文字目（先頭から前に5文字目ずらした文字）の位置を指定
        let startIndex = date.index(date.startIndex, offsetBy: 5)
        let endIndex = date.index(date.endIndex,offsetBy: -2)
        var month: Int = Int(date[startIndex...endIndex]) ?? 1
        
        // 1ヶ月後にします
        month = month + 1
        
        if month == 13 {
            year = year + 1
            month = 1
        }
     
        return String(year) + "年" + String(month) + "年"
    }
    
    // 前の月を「YYYYY年M月」で取得する関数です
    static func getPreviousDate (date: String) -> String {
        
        // 年
        var year: Int = Int(String(date.prefix(4))) ?? 1990
        
        //月
        // 5文字目（先頭から前に5文字目ずらした文字）の位置を指定
        let startIndex = date.index(date.startIndex, offsetBy: 5)
        let endIndex = date.index(date.endIndex,offsetBy: -2)
        var month: Int = Int(date[startIndex...endIndex]) ?? 1
        
        // 1ヶ月後にします
        month = month - 1
        
        if month == 0 {
            year = year - 1
            month = 12
        }
     
        return String(year) + "年" + String(month) + "年"

    }
    
    
}
