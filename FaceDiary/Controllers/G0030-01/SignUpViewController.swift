//
//  SignUpViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/17.
//

import UIKit

/**
 新規会員登録時に表示されるViewControllerです
 */

class SignUpViewController: BaseViewController {

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
        return true
    }
    
    // viewのレイアウトを行う関数です
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // ステータスバーの高さを取得
        let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        // ナビゲーションバーの高さを取得
        let navBarHeight = self.navigationController?.navigationBar.frame.size.height ?? 0
        
        let signUpView = SignUpView(frame: UIScreen.main.bounds, navBarHeight: navBarHeight, statusBarHeight: statusBarHeight)
        self.view.addSubview(signUpView)
    }
    
    // 画面をタップした際に実行される関数です
    @objc func dismissKeyboard() {
        // キーボードを閉じます
        self.view.endEditing(true)
    }

}
