//
//  UILabelDelegate.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/20.
//

import Foundation

protocol TappedDelegate: class {
    
    // タップ時に実行する関数です
    func onTapped (type: ClickTypeEnum)
    
}
