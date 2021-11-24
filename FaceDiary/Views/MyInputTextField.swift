//
//  InputTextField.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/17.
//

import UIKit


/**
 メールアドレス、パスワードを入力するカスタムテキストフィールドのViewクラスです
 */

class MyInputTextField: UITextField {
    
    // 変数
    private var imageView: UIImageView
    
    // イニシアライザ
    init (frame: CGRect, image: UIImage, title: String, type: TextTypeEnum) {
        
        // インスタンス化
        imageView = UIImageView()
        
        super.init(frame: frame)
        
        // カスタムマイズをします
        setInputTextField(image: image, title: title, type: type)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // アイコンのframeを設定します
        imageView.frame = CGRect(x: SizeConst.TEXT_FIELD_HEIGHT / 3, y: (SizeConst.TEXT_FIELD_HEIGHT - SizeConst.ICON_SIZE) / 2, width: SizeConst.ICON_SIZE, height: SizeConst.ICON_SIZE)
        
    }
    
    // leftViewのサイズを設定する関数ですfだsファmatsu
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: SizeConst.TEXT_FIELD_HEIGHT * 2 / 3 + SizeConst.ICON_SIZE, height: SizeConst.TEXT_FIELD_HEIGHT)
    }
  
    // テキストフィールドの設定を行います
    func setInputTextField (image: UIImage, title: String, type: TextTypeEnum) {
        
        // 画像
        imageView.image = image
        // 角丸の設定
        self.layer.cornerRadius = SizeConst.TEXT_FIELD_HEIGHT / 2
        // プレースホールダーの設定
        self.attributedPlaceholder = NSAttributedString(string: title, attributes: [.foregroundColor : ColorConst.MAIN_TEXT_COLOR, .font : UIFont.systemFont(ofSize: 16.0)])
        // 枠線の設定
        self.borderStyle = .none
        // 背景色
        self.backgroundColor = ColorConst.WHITE
        // 文字の色
        self.textColor = ColorConst.MAIN_TEXT_COLOR
        // 左に画像を挿入
        self.leftView = imageView
        self.leftViewMode = .always
        // キーボードの設定
        if (type == .EMAIL) {
            self.keyboardType = .default
            
        } else if (type == .PASSWORD) {
            self.keyboardType = .default
            
        }
    }
    
    
}
