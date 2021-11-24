//
//  ResetPasswordView.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/17.
//

import UIKit

/**
 パスワードリセット時に表示される画面のViewクラスです
 */

class ResetPasswordView: UIView {
    
    // 変数
    // タイトル
    private var title: UILabel
    // パスワード
    private var passwordField: MyInputTextField
    // パスワード確認用
    private var confirmPasswordField: MyInputTextField
    // リセットボタン
    private var resetButton: MyButton
    
    // statusBarの高さ
    private var statusBar: CGFloat = 0
    // navigationBarの高さ
    private var navBar: CGFloat = 0
    

    init(frame: CGRect, navBarHeight: CGFloat, statusBarHeight: CGFloat) {
        
        self.statusBar = statusBarHeight
        self.navBar = navBarHeight
    
        // インスタンス化
        title = UILabel()
        passwordField = MyInputTextField(frame: UIScreen.main.bounds, image: UIImage(named: "password")!, title: TextConst.PASSWORD, type: .PASSWORD)
        confirmPasswordField = MyInputTextField(frame: UIScreen.main.bounds, image: UIImage(named: "password")!, title: TextConst.CONFIRM_PASSWORD, type: .PASSWORD)
        resetButton = MyButton(frame: UIScreen.main.bounds, bkColor: ColorConst.WHITE, borderColor: ColorConst.WHITE.cgColor, title: "RESET", textColor: ColorConst.MAIN_COLOR)
        
        super.init(frame: frame)
        
        setTitle()
        
        self.addSubview(title)
        self.addSubview(passwordField)
        self.addSubview(confirmPasswordField)
        self.addSubview(resetButton)
        
    }
    
    // init(frame:)をオーバーライドするため、実装必要あり
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // タイトル
        title.frame = CGRect(x: 0, y: UIScreen.main.bounds.height * 0.15 - navBar - statusBar, width: UIScreen.main.bounds.width, height: title.frame.height)
        // パスワード入力
        passwordField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: title.frame.origin.y + title.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        // パスワード確認用入力
        confirmPasswordField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: passwordField.frame.origin.y + passwordField.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        
        // ログインボタン
        resetButton.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: UIScreen.main.bounds.height - SizeConst.BOTTOM_MARGIN - SizeConst.BUTTON_HEIGHT - navBar - statusBar, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.BUTTON_HEIGHT)
    }
    
    // titleの設定を行う関数です
    private func setTitle () {
        // 文字色
        title.textColor = ColorConst.WHITE
        // フォントサイズ
        title.font = FontSizeConst.X_LARGE_SIZE
        // テキスト
        title.text = "パスワードリセット画面"
        // 中央寄せ
        title.textAlignment = .center
        // 最大行数を指定(0は無制限)
        title.numberOfLines = 0;
        // frameを文字に揃える
        title.sizeToFit()
        
    }
    
}
