//
//  LoginViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/17.
//

import UIKit

/**
 ログイン時に表示されるViewControllerです
 */

class LoginViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色
        view.backgroundColor = ColorConst.MAIN_COLOR
        
        // ジェスチャー登録
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        // ジェスチャーの相殺を防ぎます
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // ナビゲーションバーのタイトルに表示するテキストを設定する関数です
    override func getTitleText () -> String {
        return ""
    }
    
    // ナビゲーションバーを表示させるかを設定する関数です
    override func showNav () -> Bool {
        return false
    }
    
 
    
    // レイアウトを行う関数です
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        let loginView = LoginView(frame: UIScreen.main.bounds, delegate: self)
        self.view.addSubview(loginView)
        
    }
    
    
    // 画面をタップした際に実行される関数です
    @objc func dismissKeyboard() {
        // キーボードを閉じます
        self.view.endEditing(true)
    }
    
}




extension LoginViewController: TappedDelegate {
    
    // タップ時に実行する関数です
    func onTapped(type: ClickTypeEnum) {
        
        switch type {
        
        case .YES_BUTTON:
            
            let vc = RegisterViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .REGISTER_LINK:
            
            let vc = SignUpViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .RESET_LINK:
            
            let vc = ResetPasswordViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        default:
            
            print("エラーが発生しました")
            
        }
    
    }
}
