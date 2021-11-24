//
//  SelectFeelingView.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/22.
//

import UIKit

/**
 感情入力画面を表示するViewクラスです
 */

class SelectFeelingView: UIView {

    // 変数
    private var checkBox1: UIButton
    private var checkBox2: UIButton
    
    // チェックされている状態
    private var checkStatus: FeelingTypeEnum
    
    
    override init (frame: CGRect) {
        
        // インスタンス化
        checkBox1 = UIButton()
        checkBox2 = UIButton()
        
        // 初期値を設定
        checkStatus = .NONCHECKED
        
        super.init(frame: frame)
        
        // 各インスタンスの設定をします
        setCheckBox()
        
        // viewを追加します
        self.addSubview(checkBox1)
        self.addSubview(checkBox2)
        
    }
    
    // init(frame:)をオーバーライドするため、実装必要あり
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        checkBox1.frame = CGRect(x: 100, y: 200, width: 30, height: 30)
        checkBox2.frame = CGRect(x: 100, y: 250, width: 30, height: 30)
        
    }
    
    // チェックボックスの設定を行う関数です
    private func setCheckBox () {
        
        // 枠線の太さ
        checkBox1.layer.borderWidth = 2.0
        // 枠線の色
        checkBox1.layer.borderColor = ColorConst.WHITE.cgColor
        // 角丸
        checkBox1.layer.cornerRadius = 3.0
        // tag
        checkBox1.tag  = FeelingTypeEnum.CHECK1.rawValue
        // イベントの設定
        checkBox1.addTarget(self, action: #selector(pushCheckBox(_:)), for: .touchUpInside)
        // チェックマークの設定
        //checkBox1.setImage(UIImage(systemName: "checkmark"), for: .normal)
        checkBox1.setImage(nil, for: .normal)
        // チェックマークの色
        checkBox1.tintColor = ColorConst.WHITE
        
        // 枠線の太さ
        checkBox2.layer.borderWidth = 2.0
        // 枠線の色
        checkBox2.layer.borderColor = ColorConst.WHITE.cgColor
        // 角丸
        checkBox2.layer.cornerRadius = 3.0
        // tag
        checkBox2.tag  = FeelingTypeEnum.CHECK2.rawValue
        // イベントの設定
        checkBox2.addTarget(self, action: #selector(pushCheckBox(_:)), for: .touchUpInside)
        // チェックマークの設定
        //checkBox2.setImage(UIImage(systemName: "checkmark"), for: .normal)
        checkBox2.setImage(nil, for: .normal)
        // チェックマークの色
        checkBox2.tintColor = ColorConst.WHITE
        
    }
    
    @objc private func pushCheckBox (_ sender: UIButton) {
        
        switch sender.tag {
        
        case FeelingTypeEnum.CHECK1.rawValue:
            
            print("check1をクリックしました")
            
            changeCheckMark(type: .CHECK1)
            
            break
            
        case FeelingTypeEnum.CHECK2.rawValue:
            
            print("check2をクリックしました")
            
            changeCheckMark(type: .CHECK2)
            
            break
            
        default:
            
            print("その他をクリックしました")
            break
        }
    
    }
    
    private func changeCheckMark (type: FeelingTypeEnum) {
        
        if checkStatus == .NONCHECKED {
            // 初めてチェックをつける場合
            checkMark(type: type)
            
        } else if checkStatus == type{
            // チェックされているチェックボックスを押下した場合
            print("何も起動しません")
            
        }else {
            // 既にチェックボックスにマークがついている場合
            
            // マークをクリアします
            clearMark(type: checkStatus)
            
            // クリックされたチェックボックスにマークをつけます
            checkMark(type: type)
            
        }
        
        // statusを変更します
        checkStatus = type
        
    }
    
    // チェックボックスのマークをクリアする関数です
    private func clearMark (type: FeelingTypeEnum) {
        
        switch type {
        
        case .CHECK1:
            print("check1を消します")
            checkBox1.setImage(nil, for: .normal)
            
            break
        case .CHECK2:
            print("check2を消します")
            checkBox2.setImage(nil, for: .normal)
            
        default:
            print("その他")
        }
        
    }
    
    // チェックボックスにマークをつける関数です
    private func checkMark (type: FeelingTypeEnum) {
        
        switch type {
        
        case .CHECK1:
            print("check1にマークをつけます")
            checkBox1.setImage(UIImage(systemName: "checkmark"), for: .normal)
            break
            
        case .CHECK2:
            print("check2にマークをつけます")
            checkBox2.setImage(UIImage(systemName: "checkmark"), for: .normal)
            break
            
        default:
            print("その他にマークをつけます")
        }
    }
   

}
