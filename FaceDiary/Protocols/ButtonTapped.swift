//
//  ButtonTapped.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/12/27.
//

import Foundation

// ポップアップ画面のボタンテキストクリック時に実行されるプロトロコルです
protocol ButtonTapped: NSObject {
    
    func tappedButton(type: ClickTypeEnum)
    
}
