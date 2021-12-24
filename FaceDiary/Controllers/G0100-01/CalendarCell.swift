//
//  CalendarCell.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/12/03.
//

import Foundation
import UIKit

class CalendarCell: UICollectionViewCell {
    
    // view
    private let textLabel: UILabel = {
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 7.0, height: UIScreen.main.bounds.width / 7.0)
        label.textColor = ColorConst.BLACK
        label.textAlignment = .center
        label.font = FontSizeConst.MIDDLE_SIZE
        label.backgroundColor = ColorConst.WHITE
        return label
        
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
        
        contentView.addSubview(textLabel)
        
    }
    
    // UILabelに設定する値を設定する関数です
    func setupContents(textName: String, section: Int, type: Int, isCurrent: Bool) {
        
        // labelの文字の設定
        textLabel.text = textName
        
        if section == 0 {
            
            switch type {
            
            case YoubiEnum.SUN.rawValue:
                // 日曜日の場合
                // 赤文字に設定します
                textLabel.textColor = ColorConst.RED
                break
                
            case YoubiEnum.SAT.rawValue:
                // 土曜日の場合
                // 青文字に設定します
                textLabel.textColor = ColorConst.BLUE
                break
                
            default:
                // 平日の場合
                // 黒文字に設定します
                textLabel.textColor = ColorConst.BLACK
                break
                
            }
            
        } else {
            
            if isCurrent {
                // 当月の場合
                textLabel.textColor = ColorConst.BLACK
                
            } else {
                // 冬月でない場合
                textLabel.textColor = ColorConst.BLACK_ALPHA
                
            }
           
        }
        
    }
    
}
