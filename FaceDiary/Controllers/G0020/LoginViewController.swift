//
//  LoginViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/17.
//

import UIKit

// ログイン時に表示されるViewControllerです

class LoginViewController: BaseViewController {
    
    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.WHITE
        label.font = FontSizeConst.X_LARGE_SIZE
        label.text = TextConst.G0020_TITLE
        label.textAlignment = .center
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var resetPWLink: UILabel = {
        
        let link = UILabel()
        link.textColor = ColorConst.WHITE
        link.font = FontSizeConst.MIDDLE_SIZE
        link.text = TextConst.RESET_PASSWORD_LINK
        link.textAlignment = .right
        link.numberOfLines = 0;
        link.sizeToFit()
        link.isUserInteractionEnabled = true
        link.tag = ClickTypeEnum.RESET_LINK.rawValue
        return link
        
    }()
    
    private var mailField: InputTextField = {
        
        let filed = InputTextField(frame: .zero, image: UIImage(named: "user")!, title: TextConst.EMAIL_PLACEHOLDER, type: .EMAIL)
        return filed
        
    }()
    
    private lazy var pwField: InputTextField = {
        
        let filed = InputTextField(frame: .zero, image: UIImage(named: "password")!, title: TextConst.EMAIL_PLACEHOLDER, type: .PASSWORD)
        return filed
        
    }()
    
    private lazy var loginButton: CustomButton = {
        
        let button = CustomButton(frame: .zero, bkColor: ColorConst.WHITE, borderColor: ColorConst.WHITE.cgColor, title: TextConst.LOGIN, textColor: ColorConst.MAIN_TEXT_COLOR)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        return button
        
        
    }()
    
    private lazy var registerLink: UILabel = {
        
        let link = UILabel()
        link.textColor = ColorConst.WHITE
        link.font = FontSizeConst.MIDDLE_SIZE
        link.text = TextConst.REGISTER_MENBER_LINK
        link.textAlignment = .center
        link.numberOfLines = 0;
        link.sizeToFit()
        link.isUserInteractionEnabled = true
        link.tag = ClickTypeEnum.REGISTER_LINK.rawValue
        return link
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初期化を行います
        setUp()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // レイアウトを行う関数です
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // layoutの設定を行います
        setLayout()
        
    }
    
    // 初期化を行う関数です
    private func setUp() {
        
        view.backgroundColor = ColorConst.MAIN_COLOR
        
        view.addSubview(titleLabel)
        view.addSubview(mailField)
        view.addSubview(pwField)
        view.addSubview(resetPWLink)
        view.addSubview(loginButton)
        view.addSubview(registerLink)
        
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        // ジェスチャーの相殺を防ぎます
        tapGR.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGR)
        
    }
    
    
    // ナビゲーションバーのタイトルに表示するテキストを設定する関数です
    override func setNavTitle () -> String {
        return ""
    }
    
    // ナビゲーションバーを表示させるかを設定する関数です
    override func showNav () -> Bool {
        return false
    }
    
    // 戻るボタンを表示させるかを設定する関数です
    override func showBackButton() -> Bool {
        return false
    }
    
    
    // Layoutを行う関数です
    private func setLayout() {
        
        // タイトル
        titleLabel.frame = CGRect(x: 0, y: getScreenHeight() * 0.15, width: getScreenWidth(), height: titleLabel.frame.height)
        // メールアドレス入力
        mailField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: titleLabel.frame.origin.y + titleLabel.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        // パスワード入力
        pwField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: mailField.frame.origin.y + mailField.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        // パスワードリセット
        resetPWLink.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: pwField.frame.origin.y + pwField.frame.height + SizeConst.LARGE_MARGIN, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2, height: resetPWLink.frame.height)
        
        let yPosition = getScreenHeight() - getSafeAreaBottom() - SizeConst.BOTTOM_MARGIN - SizeConst.BUTTON_HEIGHT - registerLink.frame.size.height - SizeConst.LARGE_MARGIN
        
        // ログインボタン
        loginButton.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: yPosition, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2, height: SizeConst.BUTTON_HEIGHT)
        // 新規会員登録リンク
        registerLink.frame = CGRect(x: 0, y: yPosition + SizeConst.BUTTON_HEIGHT + SizeConst.LARGE_MARGIN, width: getScreenWidth(), height: registerLink.frame.height)
        
    }
    
    
    // loginButtonタップ時に実行される関数です
    @objc private func login () {
        
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // 画面をタップした際に実行される関数です
    @objc private func dismissKeyboard() {
        // キーボードを閉じます
        self.view.endEditing(true)
    }
    
    
    // 画面タッチ時に実行される関数です
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: UITouch in touches {
            
            // tagを取得します
            let tag = touch.view!.tag
            
            if (tag == ClickTypeEnum.REGISTER_LINK.rawValue) {
                // 登録リンククリック時
                let vc = SignUpViewController()
                navigationController?.pushViewController(vc, animated: true)
                
            } else if (tag == ClickTypeEnum.RESET_LINK.rawValue) {
                // リセットリンククリック時
                let vc = ResetPasswordViewController()
                navigationController?.pushViewController(vc, animated: true)
                
            }
            
        }
    }
    
}

