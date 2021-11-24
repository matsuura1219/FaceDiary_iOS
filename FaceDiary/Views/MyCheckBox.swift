//
//  MyCheckBox.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/24.
//

import UIKit

/**
 チェックボックスのクラスです
 */
class MyCheckBox: UIButton {

    override init (frame: CGRect) {
        super.init(frame: frame)
    }
    
    // init(frame:)をオーバーライドするため、実装必要あり
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        
        super.layoutSubviews()
    }
   
    private func setButton () {
        
        // 枠線の太さ
        self.layer.borderWidth = 2.0
        // 枠線の色
        self.layer.borderColor = ColorConst.BLACK.cgColor
       
        
    }
    
    
}
