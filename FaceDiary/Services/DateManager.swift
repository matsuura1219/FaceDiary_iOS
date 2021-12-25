//
//  DateManager.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/23.
//

import Foundation

/**
 ヘッダーに表示する日付を計算する関数です
 */

class DateManager {
    
    // 現在の日付を「YYYYY年MM月」で取得する関数です
    static func getCurrentDate () -> String {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMM", options: 0, locale: Locale(identifier: "ja_JP"))
      
        return dateFormatter.string(from: date)
    }
    
    // 現在の年を取得する関数です
    static func getCurrentYear () -> Int {
        
        let current = Calendar.current
        return current.component(.year, from: Date())
        
    }
    
    // 現在の月を取得する関数です
    static func getCurrentMonth () -> Int {
        
        let current = Calendar.current
        return current.component(.month, from: Date())
        
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
    
    // 曜日を取得する関数です（0: Sunday, .., 6: Saturday）
    static func dayOfWeek(year: Int, month: Int, day: Int) -> Int {
        
        var year = year
        var month = month
        
        if month == 1 || month == 2 {
            year -= 1
            month += 12
        }
        
        // ツェラーの公式を用います
        return (year + year / 4 - year / 100 + year / 400 + (13 * month + 8) / 5 + day) % 7
        
    }
    
    // 1ヶ月の合計日数を取得する関数です
    static func numberOfDays(year: Int, month: Int) -> Int {
        
        var monthMaxDay = [1: 31, 2: 28, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31]
        
        if month == 2, isLeapYear(year: year) {
            // 閏年の場合
            monthMaxDay.updateValue(29, forKey: 2)
        }
        
        return monthMaxDay[month]!
    }
    
    // 閏年を判定する関数です
    static func isLeapYear(year: Int) -> Bool {
        
        // 400で割り切れる、もしくは、4で割り切れる且つ100で割り切れない
        return year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
        
    }
    
}
