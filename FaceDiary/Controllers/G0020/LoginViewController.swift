//
//  LoginViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/17.
//

import UIKit

// ログイン時に表示されるViewControllerです

class LoginViewController: BaseViewController {

    // MARK: - view variables
    
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
    
    private lazy var mailField: InputTextField = {
        
        let field = InputTextField(frame: .zero, image: UIImage(named: "user")!, title: TextConst.EMAIL_PLACEHOLDER, type: .EMAIL)
        return field
        
    }()
    
    private lazy var pwField: InputTextField = {
        
        let field = InputTextField(frame: .zero, image: UIImage(named: "password")!, title: TextConst.PASSWORD_PLACEHOLDER, type: .PASSWORD)
        return field
        
    }()
    
    private lazy var loginButton: CustomButton = {
        
        let button = CustomButton(frame: .zero, bkColor: ColorConst.WHITE, borderColor: ColorConst.WHITE.cgColor, title: TextConst.LOGIN, textColor: ColorConst.MAIN_TEXT_COLOR)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var errorEmailLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.RED
        label.font = FontSizeConst.SMALL_SIZE
        label.numberOfLines = 0;
        label.text = TextConst.MAIL_CHECK_NG
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var errorPasswordLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.RED
        label.font = FontSizeConst.SMALL_SIZE
        label.text = TextConst.PASSWORD_CHECK_NG
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
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
    
    // For Demo App
    private lazy var demoLink: UILabel = {
        
        let link = UILabel()
        link.textColor = ColorConst.WHITE
        link.font = FontSizeConst.MIDDLE_SIZE
        link.text = "Demo用リンクです"
        link.textAlignment = .right
        link.numberOfLines = 0;
        link.sizeToFit()
        link.isUserInteractionEnabled = true
        link.tag = 100
        return link
        
    }()
    
   
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }
  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayout()
        
    }
    
    
    // MARK: - override Function
    
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
    
    
    // MARK: - Function
    
    // 初期化を行う関数です
    private func setUp() {
        
        view.backgroundColor = ColorConst.MAIN_COLOR
        
        view.addSubview(titleLabel)
        view.addSubview(mailField)
        view.addSubview(pwField)
        view.addSubview(resetPWLink)
        view.addSubview(loginButton)
        view.addSubview(registerLink)
        view.addSubview(errorEmailLabel)
        view.addSubview(errorPasswordLabel)
        
        // For Demo App
        view.addSubview(demoLink)

        errorEmailLabel.isHidden = true
        errorPasswordLabel.isHidden = true
        
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        // ジェスチャーの相殺を防ぎます
        tapGR.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGR)
        
    }
    
    // Layoutを行う関数です
    private func setLayout() {
        
        // タイトル
        titleLabel.frame = CGRect(x: 0, y: getScreenHeight() * 0.15, width: getScreenWidth(), height: titleLabel.frame.height)
        // メールアドレス入力
        mailField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: titleLabel.frame.origin.y + titleLabel.frame.height + SizeConst.XX_LARGE_MARGIN, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        // ERROR用ラベル
        errorEmailLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2, y: mailField.frame.origin.y + mailField.frame.height + SizeConst.SMALL_MARGIN, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2, height: errorEmailLabel.frame.height)
        // パスワード入力
        pwField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: errorEmailLabel.frame.origin.y + errorEmailLabel.frame.height + SizeConst.LARGE_MARGIN, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        // ERROR用ラベル
        errorPasswordLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2, y: pwField.frame.origin.y + pwField.frame.height + SizeConst.SMALL_MARGIN, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2, height: errorPasswordLabel.frame.height)
        /*
        // パスワードリセット
        resetPWLink.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: errorPasswordLabel.frame.origin.y + errorPasswordLabel.frame.height + SizeConst.LARGE_MARGIN, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2, height: resetPWLink.frame.height)
        */
        
        // パスワードリセット
        resetPWLink.frame = CGRect(x: getScreenWidth() - SizeConst.SIDE_MARGIN - resetPWLink.frame.width, y: errorPasswordLabel.frame.origin.y + errorPasswordLabel.frame.height + SizeConst.LARGE_MARGIN, width: resetPWLink.frame.width, height: resetPWLink.frame.height)
        
        // For Demo App
        demoLink.frame = CGRect(x: getScreenWidth() - SizeConst.SIDE_MARGIN - demoLink.frame.width, y: resetPWLink.frame.origin.y + resetPWLink.frame.height + SizeConst.X_LARGE_MARGIN, width: demoLink.frame.width, height: demoLink.frame.height)
        
        let yPosition = getScreenHeight() - getSafeAreaBottom() - SizeConst.BOTTOM_MARGIN - SizeConst.BUTTON_HEIGHT - registerLink.frame.size.height - SizeConst.LARGE_MARGIN
        
        // ログインボタン
        loginButton.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: yPosition, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2, height: SizeConst.BUTTON_HEIGHT)
        /*
        // 新規会員登録リンク
        registerLink.frame = CGRect(x: 0, y: yPosition + SizeConst.BUTTON_HEIGHT + SizeConst.LARGE_MARGIN, width: getScreenWidth(), height: registerLink.frame.height)
        */
        
        // 新規会員登録リンク
        registerLink.frame = CGRect(x: (getScreenWidth() - SizeConst.SIDE_MARGIN * 2 - registerLink.frame.width) / 2 + SizeConst.SIDE_MARGIN, y: yPosition + SizeConst.BUTTON_HEIGHT + SizeConst.LARGE_MARGIN, width: registerLink.frame.width, height: registerLink.frame.height)
        
    }
    
    
    // MARK: - Event Function
    
    // loginButtonタップ時に実行される関数です
    @objc private func login () {
        
        var flag: Bool = true
        
        if checkEmail(text: mailField.text) {
            // 入力したメールチェックOKの場合
            errorEmailLabel.isHidden = true
            
        } else {
            // 入力したメールチェックNGの場合
            errorEmailLabel.isHidden = false
            flag = false
        }
        
        if checkPassword(text: pwField.text) {
            // 入力したパスワードチェックの場合
            errorPasswordLabel.isHidden = true
            
        } else {
            // 入力したパスワードチェックNGの場合
            errorPasswordLabel.isHidden = false
            flag = false
        }
        
        if flag == true {
            
            errorEmailLabel.isHidden = true
            errorPasswordLabel.isHidden = true
            
            let vc = RegisterViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }

    // 画面をタップした際に実行される関数です
    @objc private func dismissKeyboard() {
        // キーボードを閉じます
        self.view.endEditing(true)
    }
    
    
    // MARK: - delegate
    
    // 画面タッチ時に実行される関数です
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: UITouch in touches {
            
            // tagを取得します
            let tag = touch.view!.tag
            
            if tag == ClickTypeEnum.REGISTER_LINK.rawValue {
                // 登録リンククリック時
                let vc = SignUpViewController()
                navigationController?.pushViewController(vc, animated: true)
                
            } else if tag == ClickTypeEnum.RESET_LINK.rawValue {
                // リセットリンククリック時
                let vc = ResetPasswordViewController()
                navigationController?.pushViewController(vc, animated: true)
                
            } else if tag == 100 {
                
                // For Demp App
                let vc = HomeViewController()
                navigationController?.pushViewController(vc, animated: true)
            }
            
        }
    }
    
}
