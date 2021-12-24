//
//  AlbumViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/22.
//

import UIKit

class AlbumViewController: UIViewController {
    
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
        // セクション毎のヘッダーサイズ.
        layout.headerReferenceSize = CGSize(width: 100,height: 80)
        // collectionViewのレイアウト
        let collectionView = UICollectionView( frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        // 背景色
        collectionView.backgroundColor = .clear
        
        // セルの登録
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: "AlbumCell")
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewの追加
        view.addSubview(collectionView)
        
        // delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Section")

        
    }
    
}

extension AlbumViewController: UICollectionViewDataSource {
    
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
    
    
    /*
     Sectionに値を設定する
     */
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Section", for: indexPath)
        let label = UILabel()
        label.text = "table"
        label.frame = CGRect(x: 0, y: 20, width: collectionView.frame.width, height: 30)
        label.textColor = UIColor.black
        label.backgroundColor = ColorConst.GRAY
        headerView.backgroundColor = .clear
        label.backgroundColor = ColorConst.SUB_COLOR
        headerView.addSubview(label)
        
        return headerView
    }
    
    
}


//cellのサイズの設定
extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    
    // cellのサイズを設定します
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //ここでは画面の横サイズの半分の大きさのcellサイズを指定
        
        // 日付欄
        return CGSize(width: collectionView.frame.width / 4.0, height: collectionView.frame.width / 4.0)
        
    }
}
