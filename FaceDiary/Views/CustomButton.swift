//
//  CustomButton.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/17.
//

import UIKit

/**
 カスタムボタンのViewクラスです
 */

class CustomButton: UIButton {
    
    // イニシアライザ
    init (frame: CGRect, bkColor: UIColor, borderColor: CGColor, title: String, textColor: UIColor) {
        
        super.init(frame: frame)
        
        setCustomButton(bkColor: bkColor, borderColor: borderColor, title: title, textColor: textColor)
        
    }
    
    // init(frame:)をオーバーライドするため、実装必要あり
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        
        super.layoutSubviews()
    }
    
    // カスタムボタンの設定を行う関数です
    private func setCustomButton (bkColor: UIColor, borderColor: CGColor, title: String, textColor: UIColor) {
        // 角丸に設定
        self.layer.cornerRadius = 10.0
        // 背景色
        self.backgroundColor = bkColor
        // 枠線
        self.layer.borderColor = borderColor
        // 枠線の太さ
        self.layer.borderWidth = 2.0
        // 文字色
        self.setTitleColor(textColor, for: .normal)
        // 文字
        self.setTitle(title, for: .normal)
        
    }
}
