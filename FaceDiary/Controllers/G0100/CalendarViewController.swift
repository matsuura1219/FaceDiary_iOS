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

class CalendarViewController: BaseViewController {
    
    // 1週間の日数
    private let DAY_OF_WEEK: Int = 7
    // 1ヶ月の最大週数
    private let MAX_WEEK: Int = 6
    // 曜日ラベル
    private let DAY_OF_WEEK_LABEL = ["日", "月", "火", "水", "木", "金", "土"]
    // カレンダーに表示する年
    private var year: Int = 0
    // カレンダーに表示する月
    private var month: Int = 0
    // dialog
    private var dialogView: DialogView?
    
    
    // view
    private lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        let collectionView = UICollectionView( frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        return collectionView
        
    }()
    
    private lazy var fab: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = ColorConst.MAIN_COLOR
        button.setTitle("＋", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 1
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowOpacity = 0.5
        button.layer.backgroundColor = ColorConst.MAIN_COLOR.cgColor
        button.layer.cornerRadius = SizeConst.FAB_RADIUS / 2
        button.addTarget(self, action: #selector(pushFAB), for: .touchUpInside)
        return button
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 初期化を行います
        setUp()
        
    }
    
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
        return false
    }
    
    // 初期化を行う関数です
    private func setUp() {
        
        view.addSubview(collectionView)
        view.addSubview(fab)
        
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
    
    
    // Layoutを行う関数です
    private func setLayout() {
        
        // collectionView
        collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: view.frame.height)
        
        let left = UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN - SizeConst.FAB_RADIUS
        
        let tab = tabBarController?.tabBar.frame.size.height ?? 0
        let top = UIScreen.main.bounds.height - getSafeAreaTop() - getNavBarHeight() - tab - SizeConst.FAB_RADIUS - SizeConst.SIDE_MARGIN
        
        // FAB
        fab.frame = CGRect(x: left, y: top, width: SizeConst.FAB_RADIUS, height: SizeConst.FAB_RADIUS)
        
    }
    
    
    // グローバル変数の年と月を更新します
    private func updateYearAndMonth(status: String?) {
        
        // nillチェック
        guard let button = status else {
            return
        }
        
        if button == "next" {
            
            if month == 12 {
                year += 1
                month = 1
                
            } else {
                month += 1
                
            }
            
        } else {
            
            if month == 1 {
                year -= 1
                month = 12
                
            } else {
                month -= 1
                
            }
        }
        
    }
    
    // FAB押下時に実行される関数です
    @objc private func pushFAB() {
        
        print("FABクリックしました！")
        
        dialogView = DialogView(frame: CGRect(x: 0, y: 0, width: getScreenWidth(), height: getScreenHeight()), message: TextConst.G0100_REGISTER_POPUP, yes: TextConst.YES, no: TextConst.NO, delegate: self)
        
        guard let dialog = dialogView else {
            return
        }
        
        // ポップアップ画面を表示します
        UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first?.addSubview(dialog)
        
    }
    
    // コレクションビューの更新（通知された時に呼ばれるメソッド）
    @objc func reloadCollectionView(notification: NSNotification) {
        
        let status = notification.userInfo!["status"] as? String
        // 年と月を更新します
        updateYearAndMonth(status: status)
        self.collectionView.reloadData()
        
    }
    
}


extension CalendarViewController: ButtonTapped {
    
    // ポップアップ画面のボタンクリック時
    func tappedButton(type: ClickTypeEnum) {
        
        // ポップアップ画面を非表示にします
        dialogView?.removeFromSuperview()
        
        switch type {
        
        case .YES_BUTTON:
            print("YES!!")
            
        case .NO_BUTTON:
            print("NO!!!")
            
        default:
            print("ERROR!")
            
        }
    }
    

}

extension CalendarViewController: UICollectionViewDelegate {
    
    //Cellがクリックされた時によばれます
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            
            // 指定の年月の合計日数
            let currentMonthDaySum = DateManager.numberOfDays(year: year, month: month)
            // 指定年月日の最初の曜日
            let youbi = DateManager.dayOfWeek(year: year, month: month, day: 1)
    
            if indexPath.row >= youbi && indexPath.row < youbi + currentMonthDaySum {
              
                let tappedDay = indexPath.row - youbi + 1
                print(tappedDay)
                
            }
            
        }
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
            cell.setupContents(textName: cellText, section: indexPath.section, type: indexPath.row, isCurrent: true, color: nil)
            
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
                cell.setupContents(textName: cellText, section: indexPath.section, type: indexPath.row, isCurrent: false, color: nil)
                
            } else if indexPath.row < youbi + currentMonthDaySum {
                // 現在の日付
                let cellText = String(indexPath.row - youbi + 1)
                cell.setupContents(textName: cellText, section: indexPath.section, type: indexPath.row, isCurrent: true, color: ColorConst.BLUE)
                
            } else {
                // 翌月の日付
                let cellText = String(indexPath.row - currentMonthDaySum - youbi + 1)
                cell.setupContents(textName: cellText, section: indexPath.section, type: indexPath.row, isCurrent: false, color: nil)
                
            }
            
        }
        
        return cell
    }
    
}


extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    
    // cellのサイズを設定します
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //ここでは画面の横サイズの半分の大きさのcellサイズを指定
        
        if indexPath.section == 0 {
            // 曜日欄
            return CGSize(width: collectionView.frame.width / 7.0, height: collectionView.frame.width / 6.0)
            
        } else {
            // 日付欄
            return CGSize(width: collectionView.frame.width / 7.0, height: collectionView.frame.width / 5.0)
            
        }
        
    }
}


