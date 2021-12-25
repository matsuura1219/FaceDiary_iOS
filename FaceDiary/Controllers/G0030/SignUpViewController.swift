//
//  SignUpViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/17.
//

import UIKit

// 新規会員登録時に表示されるViewControllerです
 
class SignUpViewController: BaseViewController {
    
    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.WHITE
        label.font = FontSizeConst.X_LARGE_SIZE
        label.text = TextConst.G0030_TITLE
        label.textAlignment = .center
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var mailField: InputTextField = {
        
        let field = InputTextField(frame: .zero, image: UIImage(named: "user")!, title: TextConst.EMAIL_PLACEHOLDER, type: .EMAIL)
        return field
        
    }()
    
    private lazy var pwField: InputTextField = {
        
        let filed = InputTextField(frame: .zero, image: UIImage(named: "password")!, title: TextConst.PASSWORD_PLACEHOLDER, type: .PASSWORD)
        return filed
        
    }()
    
    private lazy var rePwField: InputTextField = {
       
        let field = InputTextField(frame: .zero, image: UIImage(named: "password")!, title: TextConst.CONFIRM_PASSWORD_PLACEHOLDER, type: .PASSWORD)
        return field
        
    }()
    
    private lazy var registerButton: CustomButton = {
        
        let button = CustomButton(frame: .zero, bkColor: ColorConst.WHITE, borderColor: ColorConst.WHITE.cgColor, title: TextConst.SINGNUP, textColor: ColorConst.MAIN_TEXT_COLOR)
        button.addTarget(self, action: #selector(pushRegisterButton), for: .touchUpInside)
        return button
        
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初期化を行います
        setUp()
       
    }
    
    // viewのレイアウトを行う関数です
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Layoutの設定を行います
        setLayout()
        
    }
    
    // ナビゲーションバーのタイトルに表示するテキストを設定する関数です
    override func setNavTitle () -> String {
        return ""
    }
    
    // ナビゲーションバーを表示させるかを設定する関数です
    override func showNav () -> Bool {
        return true
    }
    
    // 戻るボタンを表示させるかを設定する関数です
    override func showBackButton() -> Bool {
        return true
    }
    
    
    // 初期化を行う関数です
    private func setUp() {

        view.backgroundColor = ColorConst.MAIN_COLOR
        view.addSubview(titleLabel)
        view.addSubview(mailField)
        view.addSubview(pwField)
        view.addSubview(rePwField)
        view.addSubview(registerButton)
    
        
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGR)
        
    }
    
    // Layoutの設定を行う関数です
    private func setLayout() {
        
        let top = getScreenHeight() * 0.15 - getNavBarHeight() - getSafeAreaTop()

        // タイトル
        titleLabel.frame = CGRect(x: 0, y: top, width: getScreenWidth(), height: titleLabel.frame.height)
        // メールアドレス入力
        mailField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: titleLabel.frame.origin.y + titleLabel.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        // パスワード入力
        pwField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: mailField.frame.origin.y + mailField.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        // パスワード確認用入力
        rePwField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: pwField.frame.origin.y + pwField.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TEXT_FIELD_HEIGHT)
        
        let yPosition = getScreenHeight() - getSafeAreaBottom() - SizeConst.BOTTOM_MARGIN - SizeConst.BUTTON_HEIGHT - SizeConst.LARGE_MARGIN -  getNavBarHeight() - getSafeAreaTop()
        
        // ログインボタン
        registerButton.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: yPosition, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2, height: SizeConst.BUTTON_HEIGHT)
    }

    // 画面をタップした際に実行される関数です
    @objc private func dismissKeyboard() {
        // キーボードを閉じます
        view.endEditing(true)
    }
    
    // 登録ボタンを押下した際に実行される関数です
    @objc private func pushRegisterButton() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
