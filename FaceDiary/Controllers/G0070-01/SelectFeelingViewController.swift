//
//  SelectFeelingViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/22.
//

import UIKit

/**
 感情入力画面を表示するためのViewControllerです
 */

class SelectFeelingViewController: BaseViewController {

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
        
        let registerView = SelectFeelingView(frame: UIScreen.main.bounds)
        self.view.addSubview(registerView)
    }

}
