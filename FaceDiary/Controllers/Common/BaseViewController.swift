//
//  BaseViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/15.
//

import UIKit

/**
 共通処理を実装するViewControllerです
 */

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ヘッダー箇所を透明に設定しない
        self.navigationController?.navigationBar.isTranslucent = false
        // ナビゲーションバーの影を消す
        self.navigationController?.navigationBar.shadowImage = UIImage()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // ナビゲーションバーの設定を行います
        setUpNav()
        
        // ナビゲーションバーのカラーカスタマイズを行います
        customizeNavColor()
        
    }
    
  
    
    // ナビゲーションバーの設定を行う関数でう
    func setUpNav () {
        
        // ナビゲーションバーを表示させる場合
        if showNav() {
            // ナビゲーションバーのタイトルを設定します
            navigationItem.title =  getTitleText()
            // ナビゲーションバーを表示する
            navigationController?.setNavigationBarHidden(false, animated: true)
            
        } else {
            // ナビゲーションバーを表示しない
            navigationController?.setNavigationBarHidden(true, animated: true)
            
        }
        
        // 戻るボタンを表示させる場合
        if showBackButton() {
            // ナビゲーションバーの戻るボタンを表示します
            self.navigationItem.hidesBackButton = false
            
        } else {
            // ナビゲーションバーの戻るボタンを非表示にします
            self.navigationItem.hidesBackButton = true
        }
        
    }
    
    
    // ナビゲーションバーのカラーをカスタマイズする関数です
    func customizeNavColor () {
        
        //　ナビゲーションバーの背景色
        self.navigationController?.navigationBar.barTintColor = ColorConst.MAIN_COLOR
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        self.navigationController?.navigationBar.tintColor = .white
        // ナビゲーションバーのテキストを変更する
        self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]
        
    }
    
    // ナビゲーションバーのタイトルに表示するテキストを設定する関数です
    func getTitleText () -> String {
        return ""
    }
    
    // ナビゲーションバーを表示させるかを設定する関数です
    func showNav () -> Bool {
        return false
    }
    
    func showBackButton () -> Bool {
        return showNav()
    }
    
  
}
