//
//  LoginView.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/17.
//

import UIKit

/**
 ログイン時に表示される画面のViewクラスです
 */

class LoginView: UIView {
    
    // 変数
    // title
    private var title: UILabel
    // パスワードリセットリンク
    private var resetPWLink: UILabel
    // メールアドレス
    private var mailField: MyInputTextField
    // パスワード
    private var passwordField: MyInputTextField
    // ログインボタン
    private var loginButton: MyButton
    // 新規会員登録リンク
    private var registerMemberLink: UILabel
    // delegate
    weak var delegate: LoginViewController!
    
    // イニシアライザ
    init(frame: CGRect, delegate: LoginViewController) {
        
        self.delegate = delegate
        
        title = UILabel()
        mailField = MyInputTextField(frame: UIScreen.main.bounds, image: UIImage(named: "user")!, title: TextConst.EMAIL, type: .EMAIL)
        passwordField = MyInputTextField(frame: UIScreen.main.bounds, image: UIImage(named: "password")!, title: TextConst.PASSWORD, type: .PASSWORD)
        resetPWLink = UILabel()
        loginButton = MyButton(frame: UIScreen.main.bounds, bkColor: ColorConst.WHITE, borderColor: ColorConst.WHITE.cgColor, title: "LOGIN", textColor: ColorConst.MAIN_COLOR)
        registerMemberLink = UILabel()
        
        super.init(frame: frame)
        
        setTitle()
        setResetPWLink()
        setRegisterMenberLink()
        
        // イベント設定
        loginButton.addTarget(self, action: #selector(pushLoginButton), for: .touchUpInside)
        
        // viewに追加
        self.addSubview(title)
        self.addSubview(mailField)
        self.addSubview(passwordField)
        self.addSubview(resetPWLink)
        self.addSubview(loginButton)
        self.addSubview(registerMemberLink)
        
    }
    
    // init(frame:)をオーバーライドするため、実装必要あり
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        
        // タイトル
        title.frame = CGRect(x: 0, y: UIScreen.main.bounds.height * 0.15, width: UIScreen.main.bounds.width, height: title.frame.height)
        // メールアドレス入力
        mailField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: title.frame.origin.y + title.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        // パスワード入力
        passwordField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: mailField.frame.origin.y + mailField.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        // パスワードリセット
        resetPWLink.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: passwordField.frame.origin.y + passwordField.frame.height + SizeConst.LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: resetPWLink.frame.height)
        
        let yPosition = UIScreen.main.bounds.height - SizeConst.BOTTOM_MARGIN - SizeConst.BUTTON_HEIGHT - registerMemberLink.frame.size.height - SizeConst.LARGE_MARGIN
        
        // ログインボタン
        loginButton.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: yPosition, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.BUTTON_HEIGHT)
        // 新規会員登録リンク
        registerMemberLink.frame = CGRect(x: 0, y: yPosition + SizeConst.BUTTON_HEIGHT + SizeConst.LARGE_MARGIN, width: UIScreen.main.bounds.width, height: registerMemberLink.frame.height)
        
    }
    
    // titleの設定を行う関数です
    private func setTitle () {
        // 文字色
        title.textColor = ColorConst.WHITE
        // フォントサイズ
        title.font = FontSizeConst.X_LARGE_SIZE
        // テキスト
        title.text = TextConst.LOGIN_SCREEN
        // 中央寄せ
        title.textAlignment = .center
        // 最大行数を指定(0は無制限)
        title.numberOfLines = 0;
        // frameを文字に揃える
        title.sizeToFit()
        
    }
    
    // resetPWLinkの設定を行う関数です
    private func setResetPWLink () {
        
        // 文字色
        resetPWLink.textColor = ColorConst.WHITE
        // フォントサイズ
        resetPWLink.font = FontSizeConst.MIDDLE_SIZE
        // テキスト
        resetPWLink.text = TextConst.RESET_PASSWORD
        // 中央寄せ
        resetPWLink.textAlignment = .right
        // 最大行数を指定(0は無制限)
        resetPWLink.numberOfLines = 0;
        // frameを文字に揃える
        resetPWLink.sizeToFit()
        // タップを許可します
        resetPWLink.isUserInteractionEnabled = true
        // tag
        resetPWLink.tag = ClickTypeEnum.RESET_LINK.rawValue
        
    }
    
    
    // registerMemberLinkの設定を行う関数です
    private func setRegisterMenberLink () {
        
        // 文字色
        registerMemberLink.textColor = ColorConst.WHITE
        // フォントサイズ
        registerMemberLink.font = FontSizeConst.MIDDLE_SIZE
        // テキスト
        registerMemberLink.text = TextConst.REGISTER_MENBER
        // 中央寄せ
        registerMemberLink.textAlignment = .center
        // 最大行数を指定(0は無制限)
        registerMemberLink.numberOfLines = 0;
        // frameを文字に揃える
        registerMemberLink.sizeToFit()
        // タップを許可します
        registerMemberLink.isUserInteractionEnabled = true
        // tag
        registerMemberLink.tag = ClickTypeEnum.REGISTER_LINK.rawValue
        
    }
    
    @objc private func pushLoginButton () {
        
        delegate.onTapped(type: ClickTypeEnum.YES_BUTTON)
    }
 
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: UITouch in touches {
            
            // tagを取得します
            let tag = touch.view!.tag
            
            if (tag == ClickTypeEnum.REGISTER_LINK.rawValue) {
                // 登録リンククリック時
                delegate.onTapped(type: ClickTypeEnum.REGISTER_LINK)
                
            } else if (tag == ClickTypeEnum.RESET_LINK.rawValue) {
                // リセットリンククリック時
                delegate.onTapped(type: ClickTypeEnum.RESET_LINK)
                
            }
            
        }
    }
    
    
    
}
