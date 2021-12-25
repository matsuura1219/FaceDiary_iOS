//
//  BaseViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/15.
//

import UIKit

// 共通処理を実装するViewControllerです

class BaseViewController: UIViewController {
    
    // sageAreaの上部の高さ
    private var safeAreaTop: CGFloat?
    // safeAreaの下部の高さ
    private var safeAreaBottom: CGFloat?
    // navigationバーの高さ
    private var navBarHeight: CGFloat?
    // screenの高さ
    private var screenHeight: CGFloat?
    // screenの幅
    private var screenWidth: CGFloat?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ヘッダー箇所を透明に設定しません
        self.navigationController?.navigationBar.isTranslucent = false
        // ナビゲーションバーの影を消します
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if #available(iOS 11.0, *) {
            // viewDidLayoutSubviewsではSafeAreaの取得ができている
            
            if showNav() {
                safeAreaTop = navigationController?.view.safeAreaInsets.top
                safeAreaBottom = navigationController?.view.safeAreaInsets.bottom
                
            } else {
                safeAreaTop = view.safeAreaInsets.top
                safeAreaBottom = view.safeAreaInsets.bottom
            }
           
            navBarHeight = navigationController?.navigationBar.frame.size.height
            screenHeight = UIScreen.main.bounds.height
            screenWidth = UIScreen.main.bounds.width
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // ナビゲーションバーの設定を行います
        setUpNavBar()
        
    }
    
    // navigationの設定を行う関数です
    private func setUpNavBar() {
        
        //　ナビゲーションバーの背景色
        self.navigationController?.navigationBar.barTintColor = ColorConst.MAIN_COLOR
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        self.navigationController?.navigationBar.tintColor = .white
        // ナビゲーションバーのテキストを変更する
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        if showNav() {
            // navigationを表示させる場合
            // ナビゲーションバーのタイトルを設定します
            navigationItem.title = setNavTitle()
            // ナビゲーションバーを表示します
            navigationController?.setNavigationBarHidden(false, animated: true)
            
        } else {
            // ナビゲーションバーを表示しません
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
        
        if showBackButton() {
            // 戻るボタンを表示させる場合
            // ナビゲーションバーの戻るボタンを表示します
            self.navigationItem.hidesBackButton = false
            
        } else {
            // ナビゲーションバーの戻るボタンを非表示にします
            self.navigationItem.hidesBackButton = true
            
        }
    }
    
    // サブクラスで設定を行う関数です
    
    func showNav() -> Bool {
        return false
    }
    
    func showBackButton() -> Bool {
        return false
    }
    
    func setNavTitle() -> String {
        return ""
    }
    
    // Emailのチェック用関数です
    func checkEmail(text: String?) -> Bool {
        
        guard let email = text else {
            return false
        }
        
        if email.count < 8 {
            return false
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        if NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email) {
            return true
        }
        
        return false
    }
    
    // Passwordのチェック用関数です
    func checkPassword(text: String?) -> Bool {
        
        guard let password = text else {
            return false
        }
        
        if password.count >= 8 {
            return true
        }
        
        return false
    }
    
    
    // SETTER
    
    func getSafeAreaTop() -> CGFloat {
        return safeAreaTop ?? 0.0
    }
    
    func getSafeAreaBottom() -> CGFloat {
        return safeAreaBottom ?? 0.0
    }
    
    func getNavBarHeight() -> CGFloat {
        return navBarHeight ?? 0.0
    }
    
    func getScreenHeight() -> CGFloat {
        return screenHeight ?? 0.0
    }
    
    func getScreenWidth() -> CGFloat {
        return screenWidth ?? 0.0
    }
    
    func getContentHeight() -> CGFloat {
        return getScreenHeight() - getSafeAreaTop() - getSafeAreaBottom() - getNavBarHeight()
    }
    
}
