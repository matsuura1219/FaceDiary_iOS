//
//  RegisterViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/16.
//

import UIKit

/**
今日の顔画像と感情を登録するかを確認するViewControllerです
*/

class RegisterViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色
        view.backgroundColor = ColorConst.MAIN_COLOR
        
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let registerView = RegisterView(frame: UIScreen.main.bounds)
        self.view.addSubview(registerView)
    }
    
    
}
