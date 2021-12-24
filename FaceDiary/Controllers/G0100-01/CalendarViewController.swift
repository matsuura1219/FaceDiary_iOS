//
//  CalendarViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/22.
//

import UIKit

/**
 カレンダーを表示するViewControllerです
 */

class CalendarViewController: UIViewController {
    
    // 変数
    // 1週間の日数
    private let DAY_OF_WEEK: Int = 7
    // 1ヶ月の最大週数
    private let MAX_WEEK: Int = 6
    // 曜日ラベル
    // private let DAY_OF_WEEK_LABEL = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sun"]
    private let DAY_OF_WEEK_LABEL = ["日", "月", "火", "水", "木", "金", "土"]
    
    // カレンダーに表示する年月
    private var year: Int = 0
    private var month: Int = 0
    
    // view
    private lazy var collectionView: UICollectionView = {
        
        // セルのレイアウト設計
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        // 各々の設計に合わせて調整
        // スクロールの方向
        layout.scrollDirection = .vertical
        // セル同士（横同士）の間隔
        layout.minimumInteritemSpacing = 0.0
        // 行間の間隔
        layout.minimumLineSpacing = 0.0
        // collectionViewのレイアウト
        let collectionView = UICollectionView( frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        // 背景色
        collectionView.backgroundColor = .clear
        
        // セルの登録
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        return collectionView
        
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewの追加
        view.addSubview(collectionView)

        
        // 背景色の設定
        view.backgroundColor = ColorConst.WHITE
        
        // 現在の年月をグローバル変数に設定します
        year = DateManager.getCurrentYear()
        month = DateManager.getCurrentMonth()
        
        
        // delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // HomeViewControllerから通知を受け取る
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollectionView(notification:)), name: NSNotification.Name(rawValue: "reload"), object: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // frameの設定
        collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: view.frame.height)
      
    }
    
    
    // コレクションビューの更新（通知された時に呼ばれるメソッド）
    @objc func reloadCollectionView(notification: NSNotification) {
        
        let status = notification.userInfo!["status"] as? String
        
        if status == "next" {
            
            if month == 12 {
                
                year += 1
                month = 1
                
            } else {
                
                month += 1
            }
            
        } else if status == "back" {
            
            if month == 1 {
                
                year -= 1
                month = 12
                
            } else {
                
                month -= 1
                
            }
        }
        
        self.collectionView.reloadData()
        
    
        
        print("リロードします")
    }
    
}


extension CalendarViewController: UICollectionViewDataSource {
    
    // セクションの数(０：曜日ラベル、１：日付)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // cellの合計数を戻り値に設定します
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // section毎にcellの総数を設定します
        if section == 0 {
            // 曜日ラベルセクションの場合
            return DAY_OF_WEEK
            
        } else {
            // 日付セクションの場合
            return DAY_OF_WEEK * MAX_WEEK
        }
        
    }
    
    // cellの設定を行います
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        
        if indexPath.section == 0 {
            // 曜日欄の場合
            
            let cellText = DAY_OF_WEEK_LABEL[indexPath.row]
            cell.setupContents(textName: cellText, section: indexPath.section, type: indexPath.row, isCurrent: true)
            
        } else {
            // 日付欄の場合
            
            // 指定の年月の合計日数
            let currentMonthDaySum = DateManager.numberOfDays(year: year, month: month)
            // 指定年月日の最初の曜日
            let youbi = DateManager.dayOfWeek(year: year, month: month, day: 1)
            // 前月の年月の合計日数
            var previousMonthDaySum = 0
            
            if month == 1 {
                previousMonthDaySum = DateManager.numberOfDays(year: year, month: 12)
            } else {
                previousMonthDaySum = DateManager.numberOfDays(year: year, month: month - 1)
            }
            
            if indexPath.row < youbi {
                // 前月の日付
                let cellText = String(previousMonthDaySum - youbi + indexPath.row + 1)
                cell.setupContents(textName: cellText, section: indexPath.section, type: indexPath.row, isCurrent: false)
                
            } else if indexPath.row < youbi + currentMonthDaySum {
                // 現在の日付
                let cellText = String(indexPath.row - youbi + 1)
                cell.setupContents(textName: cellText, section: indexPath.section, type: indexPath.row, isCurrent: true)
                
            } else {
                // 翌月の日付
                let cellText = String(indexPath.row - currentMonthDaySum - youbi + 1)
                cell.setupContents(textName: cellText, section: indexPath.section, type: indexPath.row, isCurrent: false)
                
            }
            
            
        }
        
        return cell
    }
    
}


//cellのサイズの設定
extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    
    // cellのサイズを設定します
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //ここでは画面の横サイズの半分の大きさのcellサイズを指定
        
        if indexPath.section == 0 {
            // 曜日欄
            return CGSize(width: collectionView.frame.width / 7.0, height: collectionView.frame.width / 7.0)
            
        } else {
            
            // 日付欄
            return CGSize(width: collectionView.frame.width / 7.0, height: collectionView.frame.width / 7.0)
            
        }
        
    }
}
