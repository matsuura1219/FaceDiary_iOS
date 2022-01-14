//
//  AlbumViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/22.
//

import UIKit

class AlbumViewController: BaseViewController {
    
    // MARK: - view variables
    
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
        // セクション毎のヘッダーサイズ.
        layout.headerReferenceSize = CGSize(width: 100,height: SizeConst.LARGE_MARGIN * 2 + SizeConst.SECTION_LABEL_HEIGHT)
        // collectionViewのレイアウト
        let collectionView = UICollectionView( frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        // 背景色
        collectionView.backgroundColor = .clear
        
        // セルの登録
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: "AlbumCell")
        return collectionView
        
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayout()
    }
    
    
    // MARK: - override Function
    
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
    
    
    // MARK: - Function
    
    // 初期化を行う関数です
    private func setUp() {

        view.addSubview(collectionView)
        
        // delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Section")
        
    }
    
    // Layoutを行う関数です
    private func setLayout() {
        
        let tabBarHeight = tabBarController?.tabBar.frame.size.height ?? 0
        collectionView.frame = CGRect(x: 0, y: 0, width: getScreenWidth(), height: getScreenHeight() - getSafeAreaTop() - getNavBarHeight() - tabBarHeight)
    }
    
}

extension AlbumViewController: UICollectionViewDataSource {
    
    // MARK: - delegate
    
    // セクションの数(０：曜日ラベル、１：日付)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // cellの合計数を戻り値に設定します
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
        
    }
    
    // cellの設定を行います
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        return cell
    }
    
    // Sectionに値を設定する
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Section", for: indexPath)
        let label = UILabel()
        label.text = "   2021 / 12"
        label.frame = CGRect(x: 0, y: SizeConst.LARGE_MARGIN, width: collectionView.frame.width, height: SizeConst.SECTION_LABEL_HEIGHT)
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.backgroundColor = ColorConst.SUB_COLOR
        headerView.backgroundColor = ColorConst.WHITE
        label.backgroundColor = ColorConst.SUB_COLOR
        headerView.addSubview(label)
        return headerView
        
    }
    
}


//cellのサイズの設定
extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: - delegate
    
    // cellのサイズを設定します
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 4.0, height: collectionView.frame.width / 4.0)
        
    }
}
