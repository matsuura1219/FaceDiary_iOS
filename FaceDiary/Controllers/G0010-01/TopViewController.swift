//
//  TopViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/15.
//

import UIKit

/**
 アプリ起動時に表示されるViewControllerです
 */

class TopViewController: BaseViewController {
    
    // viewがメモリにロードされた際に実行される関数です
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色
        view.backgroundColor = ColorConst.MAIN_COLOR
        
        // 2.0s後に画面遷移をします
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(moveToNextScreen), userInfo: nil, repeats: false)
        
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
    
    // viewのレイアウトを行う関数です
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        let topView = TopView(frame: UIScreen.main.bounds)
        self.view.addSubview(topView)
    }
    
    @objc func moveToNextScreen () {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
