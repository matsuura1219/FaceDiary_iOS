//
//  MonthDateManager.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/25.
//

import Foundation


/* カレンダー表示に使用するクラスです */

class MonthDateManager {
    
    // 曜日を取得する関数です（0: Sunday, .., 6: Saturday）
    private func dayOfWeek(year: Int, month: Int, day: Int) -> Int {
        
        var year = year
        var month = month
        
        if month == 1 || month == 2 {
            year -= 1
            month += 12
        }
        
        // ツェラーの公式を用います
        return (year + year / 4 - year / 100 + year / 400 + (13 * month + 8) / 5 + day) % 7
        
    }
    
    // 週の数を計算する
    private func numberOfWeeks(_ year: Int, _ month: Int) -> Int {
        
        if conditionFourWeeks(year: year, month: month) {
            // 1ヶ月が4週の場合
            return 4
            
        } else if conditionSixWeeks(year, month) {
            // 1ヶ月が6週の場合
            return 6
            
        } else {
            // それ以外の場合
            return 5
            
        }
    }
    
    // 1ヶ月が4週かどうかを判定する関数です
    private func conditionFourWeeks(year: Int, month: Int) -> Bool {
        
        let firstDayOfWeek = dayOfWeek(year: year, month: month, day: 1)
        
        // 月の日数が30日間でかつ初日が土曜日の場合と，月の日数が31日間で初日が金曜日か土曜日の場合
        return !isLeapYear(year: year) && month == 2 && (firstDayOfWeek == 0)
    }
    
    // 1ヶ月が6週かどうかを判定する関数です
    func conditionSixWeeks(_ year: Int, _ month: Int) -> Bool {
        
        let firstDayOfWeek = dayOfWeek(year: year, month: month, day: 1)
        let days = numberOfDays(year: year, month: month)
        
        // 月の日数が30日間でかつ初日が土曜日の場合と，月の日数が31日間で初日が金曜日か土曜日の場合
        return (firstDayOfWeek == 6 && days == 30) || (firstDayOfWeek >= 5 && days == 31)
    }
    
    // 1ヶ月の合計日数を取得する関数です
    private func numberOfDays(year: Int, month: Int) -> Int {
        
        var monthMaxDay = [1: 31, 2: 28, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31]
        
        if month == 2, isLeapYear(year: year) {
            // 閏年の場合
            monthMaxDay.updateValue(29, forKey: 2)
        }
        
        return monthMaxDay[month]!
    }
    
    // 閏年を判定する関数です
    private func isLeapYear(year: Int) -> Bool {
        
        // 400で割り切れる、もしくは、4で割り切れる且つ100で割り切れない
        return year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
        
    }
    
}
