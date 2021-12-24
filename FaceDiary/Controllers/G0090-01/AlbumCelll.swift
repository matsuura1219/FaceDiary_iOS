//
//  AlbumCellCollectionViewCell.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/12/24.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    // view
    private let imgView: UIImageView = {
        
        let imgView = UIImageView()
        imgView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 4.0, height: UIScreen.main.bounds.width / 4.0)
        imgView.image = UIImage(named: "user")
        return imgView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // cellの設定を行います
        setCell()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // cellの設定を行う関数です
    private func setCell() {
        
        contentView.addSubview(imgView)
        
    }
    
}
