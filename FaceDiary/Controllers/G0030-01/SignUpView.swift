//
//  SignUpView.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/17.
//

import UIKit

/**
 新規会員登録時に表示される画面のViewクラスです
 */

class SignUpView: UIView {
    
    
    // 変数
    // タイトル
    private var title: UILabel
    // メールアドレス
    private var mailField: MyInputTextField
    // パスワード
    private var passwordField: MyInputTextField
    // パスワード確認用
    private var confirmPasswordField: MyInputTextField
    // 登録ボタン
    private var registerButton: MyButton
    
    // statusBarの高さ
    private var statusBar: CGFloat = 0
    // navigationBarの高さ
    private var navBar: CGFloat = 0
    
    
    init(frame: CGRect, navBarHeight: CGFloat, statusBarHeight: CGFloat) {
        
        self.statusBar = statusBarHeight
        self.navBar = navBarHeight
    
        // インスタンス化
        title = UILabel()
        mailField = MyInputTextField(frame: UIScreen.main.bounds, image: UIImage(named: "user")!, title: TextConst.EMAIL, type: .EMAIL)
        passwordField = MyInputTextField(frame: UIScreen.main.bounds, image: UIImage(named: "password")!, title: TextConst.PASSWORD, type: .PASSWORD)
        confirmPasswordField = MyInputTextField(frame: UIScreen.main.bounds, image: UIImage(named: "password")!, title: TextConst.CONFIRM_PASSWORD, type: .PASSWORD)
        registerButton = MyButton(frame: UIScreen.main.bounds, bkColor: ColorConst.WHITE, borderColor: ColorConst.WHITE.cgColor, title: "SIGN UP", textColor: ColorConst.MAIN_TEXT_COLOR)
        
        super.init(frame: frame)
        
        setTitle()
        
        self.addSubview(title)
        self.addSubview(mailField)
        self.addSubview(passwordField)
        self.addSubview(confirmPasswordField)
        self.addSubview(registerButton)
        
    }
    
    // init(frame:)をオーバーライドするため、実装必要あり
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // タイトル
        title.frame = CGRect(x: 0, y: UIScreen.main.bounds.height * 0.15 - navBar - statusBar, width: UIScreen.main.bounds.width, height: title.frame.height)
        // メールアドレス入力
        mailField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: title.frame.origin.y + title.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        // パスワード入力
        passwordField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: mailField.frame.origin.y + mailField.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        // パスワード確認用入力
        confirmPasswordField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: passwordField.frame.origin.y + passwordField.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        
        // ログインボタン
        registerButton.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: UIScreen.main.bounds.height - SizeConst.BOTTOM_MARGIN - SizeConst.BUTTON_HEIGHT - navBar - statusBar, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.BUTTON_HEIGHT)
    }
    
    // titleの設定を行う関数です
    private func setTitle () {
        // 文字色
        title.textColor = ColorConst.WHITE
        // フォントサイズ
        title.font = FontSizeConst.X_LARGE_SIZE
        // テキスト
        title.text = TextConst.REGISTER_SCREEN
        // 中央寄せ
        title.textAlignment = .center
        // 最大行数を指定(0は無制限)
        title.numberOfLines = 0;
        // frameを文字に揃える
        title.sizeToFit()
        
    }
    
    
}
