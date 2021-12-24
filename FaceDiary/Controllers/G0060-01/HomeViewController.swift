//
//  HomeViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/15.
//

import UIKit

/**
 ホーム画面を表示するためのViewControllerです
 */

class HomeViewController: UITabBarController {
    
    // 日付変数
    var date: String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色を設定します
        self.view.backgroundColor = ColorConst.WHITE
        
        // delegateを設定します
        self.delegate = self
        
        // タブの設定をします
        setTabBar()
        
        // 最初に表示するタブをカレンダーに設定します
        selectedIndex = ContentTypeEnum.TIMELINE.rawValue
        
        // タイトルを設定します
        date = DateManager.getCurrentDate()
        navigationItem.title = date
        
        print(DateManager.getNextDate(date: date))
        

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // ナビゲーションバーの設定をします
        customizeNavColor()
        
        
    }
    

    
    // ナビゲーションバーのカラーをカスタマイズする関数です
    private func customizeNavColor () {
        
        // ナビゲーションバーを表示する
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "next >",
            style: .plain,
            target: self,
            action: #selector(actionNext)
        )
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "< back",
            style: .plain,
            target: self,
            action: #selector(actionBack)
        )
        
        // ヘッダー箇所を透明に設定しない
        self.navigationController?.navigationBar.isTranslucent = false
        // ナビゲーションバーの影を消す
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        // 選択したタブの色を設定します
        UITabBar.appearance().tintColor = ColorConst.SECONDARY_COLOR
        
        //　ナビゲーションバーの背景色
        self.navigationController?.navigationBar.barTintColor = ColorConst.MAIN_COLOR
        //　フッターの背景色
        tabBar.barTintColor = ColorConst.MAIN_COLOR
        // 透明に設定しない
        tabBar.isTranslucent = false
        
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        self.navigationController?.navigationBar.tintColor = .white
        // ナビゲーションバーのテキストを変更する
        self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]
        
    }
    
    
    // タブの設定を行う関数です
    private func setTabBar () {
        
        let timelineViewController = TimelineViewController()
        timelineViewController.tabBarItem = UITabBarItem(title: "Timeline", image: UIImage(named: "timeline"), tag: 0)
        
        let calendarViewController = CalendarViewController()
        calendarViewController.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), tag: 0)
        
        let albumViewController = AlbumViewController()
        albumViewController.tabBarItem = UITabBarItem(title: "Album", image: UIImage(named: "album"), tag: 0)
        
        viewControllers = [timelineViewController, calendarViewController, albumViewController]
        // viewControllers = [timelineViewController, albumViewController]
        
    }
    
    // ヘッダーのタイトルを設定する関数です
    func setTitle (type: ContentTypeEnum) {
        
        var title: String = ""
        
        switch type {
        
        case .TIMELINE:
            // タイムラインタブの場合
            title = "タイムライン"
            break
            
        case .ALBUM:
            // アルバムタブの場合
            title = "アルバム"
            break
            
        case .CALENDAR:
            // カレンダータブの場合
            title = date
            break
            
        }
        
        // タイトルを設定します
        navigationItem.title =  title
        
    }
    
    
    
    // コンテンツに応じて、ヘッダー上のボタンを表示させるかどうか決定する関数です
    private func showNavItem (type: ContentTypeEnum) {
        
        if type == .CALENDAR {
            // カレンダータブの場合
            
            if (self.navigationItem.rightBarButtonItem == nil) {
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(
                    title: "next >",
                    style: .plain,
                    target: self,
                    action: #selector(actionNext)
                )
            }
            
            if (self.navigationItem.leftBarButtonItem == nil) {
                self.navigationItem.leftBarButtonItem = UIBarButtonItem(
                    title: "< back",
                    style: .plain,
                    target: self,
                    action: #selector(actionBack)
                )
            }
            
            
            
            
        } else {
            // それ以外の場合
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.rightBarButtonItem = nil
        }
        
    }
    
    
    // 次へボタン押下時に実行される関数です
    @objc private func actionNext() {
        
        date = DateManager.getNextDate(date: date)
        self.navigationItem.title = date
        
        // CalendarViewControllerへ通知を送る
        NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil, userInfo: ["status": "next"])
    }
    
    // 戻るボタン押下時に実行される関数です
    @objc private func actionBack() {
        
        date = DateManager.getPreviousDate(date: date)
        self.navigationItem.title = date
        
        // CalendarViewControllerへ通知を送る
        NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil, userInfo: ["status": "back"])
        
    }
    
    
}


extension HomeViewController: UITabBarControllerDelegate {
    
    // タブをクリックしたときに実行される関数です
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if viewController is CalendarViewController {
            // カレンダータブをクリックした場合
            // ヘッダーのタイトルを設定します
            setTitle(type: .CALENDAR)
            // navigationItmeを表示します
            showNavItem(type: .CALENDAR)
            
        } else if viewController is TimelineViewController {
            // タイムラインタブをクリックした場合
            // ヘッダーのタイトルを設定します
            setTitle(type: .TIMELINE)
            // navigationItmeを非表示にします
            showNavItem(type: .TIMELINE)
            
        } else if viewController is AlbumViewController {
            // アルバムタブをクリックした場合
            // ヘッダーのタイトルを設定します
            setTitle(type: .ALBUM)
            // navigationItmeを非表示にします
            showNavItem(type: .ALBUM)
            
        }
        
    }
   
}
