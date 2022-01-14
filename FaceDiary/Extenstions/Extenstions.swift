//
//  Extenstions.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/12/29.
//

import Foundation
import UIKit

// MARK: - Notificationの拡張クラスです

extension Notification.Name {
    
    // MARK: - 定数
    
    // CalendarViewController → HomeViewController
    static let registerFeelingName = Notification.Name("registerFeelingName")
    
    // HomeViewController → CalendarViewController
    static let releadCell = Notification.Name("reloadCell")
    
}
