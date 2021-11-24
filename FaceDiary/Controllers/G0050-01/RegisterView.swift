//
//  RegisterView.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/16.
//

import UIKit

/**
今日の顔画像と感情を登録するかを確認するViewController用のViewクラスです
*/

class RegisterView: UIView {

    // 変数
    // タイトル
    private var title: UILabel
    // 画像
    private var imageView: UIImageView
    // 登録ボタン
    private var yesButton: MyButton
    // 後でボタン
    private var noButton: MyButton
    
    override init(frame: CGRect) {
        
        // インスタンス化
        title = UILabel()
        imageView = UIImageView(image: UIImage(named: "register"))
        yesButton = MyButton(frame: UIScreen.main.bounds, bkColor: ColorConst.WHITE, borderColor: ColorConst.MAIN_COLOR.cgColor, title: "登録", textColor: ColorConst.MAIN_COLOR)
        noButton = MyButton(frame: UIScreen.main.bounds, bkColor: ColorConst.MAIN_COLOR, borderColor: ColorConst.WHITE.cgColor, title: "後で", textColor: ColorConst.WHITE)
        
        super.init(frame: frame)
        
        setTitle()
        
        self.addSubview(title)
        self.addSubview(imageView)
        self.addSubview(yesButton)
        self.addSubview(noButton)
        
    }
    
    // init(frame:)をオーバーライドするため、実装必要あり
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 画像のサイズを設定します
        let image = UIImage(named: "register")!
        var imgWidth = image.size.width
        var imgHeight = image.size.height
        let per = imgHeight / imgWidth
        
        imgWidth = UIScreen.main.bounds.width * 0.4
        imgHeight = imgWidth * per
       
        // frameの設定をします
        title.frame = CGRect(x: 0, y: UIScreen.main.bounds.height * 0.15, width: UIScreen.main.bounds.width, height: title.frame.height)
        imageView.frame = CGRect(x: UIScreen.main.bounds.width * 0.3, y: (UIScreen.main.bounds.height - imgHeight) / 2, width: imgWidth, height: imgHeight)
        
        let buttonWidth = (UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 3) / 2
        
        noButton.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: UIScreen.main.bounds.height - SizeConst.BOTTOM_MARGIN - SizeConst.BUTTON_HEIGHT, width: buttonWidth, height: SizeConst.BUTTON_HEIGHT)
        yesButton.frame = CGRect(x: buttonWidth + SizeConst.SIDE_MARGIN * 2, y: UIScreen.main.bounds.height - SizeConst.BOTTOM_MARGIN - SizeConst.BUTTON_HEIGHT, width: buttonWidth, height: SizeConst.BUTTON_HEIGHT)
       
        
    }
    
    // titleの設定を行う関数です
    private func setTitle () {
        // 文字色
        title.textColor = ColorConst.WHITE
        // フォントサイズ
        title.font = FontSizeConst.X_LARGE_SIZE
        // テキスト
        title.text = "今日のあなたを登録しますか？"
        // 中央寄せ
        title.textAlignment = .center
        // 最大行数を指定(0は無制限)
        title.numberOfLines = 0;
        // frameを文字に揃える
        title.sizeToFit()
        
    }
    
   
}
