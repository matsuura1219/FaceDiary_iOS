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
    // タイトル
    private var title: UILabel
    // チェックボックス１
    private var checkBox1: UIButton
    // チェック項目１
    private var item1: UILabel
    // チェックボックス２
    private var checkBox2: UIButton
    // チェック項目２
    private var item2: UILabel
    // チェックボックス３
    private var checkBox3: UIButton
    // チェック項目３
    private var item3: UILabel
    // チェックボックス４
    private var checkBox4: UIButton
    // チェック項目４
    private var item4: UILabel
    // 確定ボタン
    private var confirmButton: MyButton
    
    // チェックされている状態
    private var checkStatus: FeelingTypeEnum
    
    
    override init (frame: CGRect) {
        
        // インスタンス化
        title = UILabel()
        checkBox1 = UIButton()
        item1 = UILabel()
        checkBox2 = UIButton()
        item2 = UILabel()
        checkBox3 = UIButton()
        item3 = UILabel()
        checkBox4 = UIButton()
        item4 = UILabel()
        confirmButton = MyButton(frame: UIScreen.main.bounds, bkColor: ColorConst.WHITE, borderColor: ColorConst.WHITE.cgColor, title: "確定", textColor: ColorConst.MAIN_TEXT_COLOR)
        
        // 初期値を設定
        checkStatus = .NONCHECKED
        
        super.init(frame: frame)
        
        // 各インスタンスの設定をします
        setTitle()
        setCheckBox()
        setItem()
        setConfirmButton()
        
        // viewを追加します
        self.addSubview(title)
        self.addSubview(checkBox1)
        self.addSubview(item1)
        self.addSubview(checkBox2)
        self.addSubview(item2)
        self.addSubview(checkBox3)
        self.addSubview(item3)
        self.addSubview(checkBox4)
        self.addSubview(item4)
        self.addSubview(confirmButton)
        
        // イベント設定
        confirmButton.addTarget(self, action: #selector(pushConfirmButton), for: .touchUpInside)
        
        
    }
    
    // init(frame:)をオーバーライドするため、実装必要あり
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        title.frame = CGRect(x: 0, y: UIScreen.main.bounds.height * 0.15, width: UIScreen.main.bounds.width, height: title.frame.height)
        
        checkBox1.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2, y: title.frame.origin.y + title.frame.height + SizeConst.XXX_LARGE_MARGIN, width: SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        item1.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2 + SizeConst.CHECKBOX_SIZE + 15, y: title.frame.origin.y + title.frame.height + SizeConst.XXX_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2 - SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        
        checkBox2.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2, y: checkBox1.frame.origin.y + checkBox1.frame.height + SizeConst.X_LARGE_MARGIN, width: SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        item2.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2 + SizeConst.CHECKBOX_SIZE + 15, y: checkBox1.frame.origin.y + checkBox1.frame.height + SizeConst.X_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2 - SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        
        checkBox3.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2, y: checkBox2.frame.origin.y + checkBox2.frame.height + SizeConst.X_LARGE_MARGIN, width: SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        item3.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2 + SizeConst.CHECKBOX_SIZE + 15, y: checkBox2.frame.origin.y + checkBox2.frame.height + SizeConst.X_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2 - SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        
        checkBox4.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2, y: checkBox3.frame.origin.y + checkBox3.frame.height + SizeConst.X_LARGE_MARGIN, width: SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        item4.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2 + SizeConst.CHECKBOX_SIZE + 15, y: checkBox3.frame.origin.y + checkBox3.frame.height + SizeConst.X_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2 - SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        
        confirmButton.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: UIScreen.main.bounds.height - SizeConst.BOTTOM_MARGIN - SizeConst.BUTTON_HEIGHT, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.BUTTON_HEIGHT)
        
    }
    
    // titleの設定を行う関数です
    private func setTitle () {
        // 文字色
        title.textColor = ColorConst.WHITE
        // フォントサイズ
        title.font = FontSizeConst.X_LARGE_SIZE
        // テキスト
        title.text = "今日のあなたはどうでしたか？"
        // 中央寄せ
        title.textAlignment = .center
        // 最大行数を指定(0は無制限)
        title.numberOfLines = 0;
        // frameを文字に揃える
        title.sizeToFit()
        
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
        checkBox2.setImage(nil, for: .normal)
        // チェックマークの色
        checkBox2.tintColor = ColorConst.WHITE
        
        // 枠線の太さ
        checkBox3.layer.borderWidth = 2.0
        // 枠線の色
        checkBox3.layer.borderColor = ColorConst.WHITE.cgColor
        // 角丸
        checkBox3.layer.cornerRadius = 3.0
        // tag
        checkBox3.tag  = FeelingTypeEnum.CHECK3.rawValue
        // イベントの設定
        checkBox3.addTarget(self, action: #selector(pushCheckBox(_:)), for: .touchUpInside)
        // チェックマークの設定
        checkBox3.setImage(nil, for: .normal)
        // チェックマークの色
        checkBox3.tintColor = ColorConst.WHITE
        
        // 枠線の太さ
        checkBox4.layer.borderWidth = 2.0
        // 枠線の色
        checkBox4.layer.borderColor = ColorConst.WHITE.cgColor
        // 角丸
        checkBox4.layer.cornerRadius = 3.0
        // tag
        checkBox4.tag  = FeelingTypeEnum.CHECK4.rawValue
        // イベントの設定
        checkBox4.addTarget(self, action: #selector(pushCheckBox(_:)), for: .touchUpInside)
        // チェックマークの設定
        checkBox4.setImage(nil, for: .normal)
        // チェックマークの色
        checkBox4.tintColor = ColorConst.WHITE
        
    }
    
    // チェック項目を設定する関数です
    private func setItem () {
        
        // 文字色
        item1.textColor = ColorConst.WHITE
        // フォントサイズ
        item1.font = FontSizeConst.LARGE_SIZE
        // テキスト
        item1.text = "サイコーでした！"
        // 中央寄せ
        item1.textAlignment = .left
        // 最大行数を指定(0は無制限)
        item1.numberOfLines = 0;
        // frameを文字に揃える
        item1.sizeToFit()
        
        // 文字色
        item2.textColor = ColorConst.WHITE
        // フォントサイズ
        item2.font = FontSizeConst.LARGE_SIZE
        // テキスト
        item2.text = "ハッピーでした！"
        // 中央寄せ
        item2.textAlignment = .left
        // 最大行数を指定(0は無制限)
        item2.numberOfLines = 0;
        // frameを文字に揃える
        item2.sizeToFit()
        
        // 文字色
        item3.textColor = ColorConst.WHITE
        // フォントサイズ
        item3.font = FontSizeConst.LARGE_SIZE
        // テキスト
        item3.text = "最悪でした！"
        // 中央寄せ
        item3.textAlignment = .left
        // 最大行数を指定(0は無制限)
        item3.numberOfLines = 0;
        // frameを文字に揃える
        item3.sizeToFit()
        
        // 文字色
        item4.textColor = ColorConst.WHITE
        // フォントサイズ
        item4.font = FontSizeConst.LARGE_SIZE
        // テキスト
        item4.text = "ダメでした！"
        // 中央寄せ
        item4.textAlignment = .left
        // 最大行数を指定(0は無制限)
        item4.numberOfLines = 0;
        // frameを文字に揃える
        item4.sizeToFit()
        
    }
    
    // 確定ボタンの設定を行う関数です
    private func setConfirmButton () {
        
        // 非活性状態にします
        confirmButton.isEnabled = false
        // 透明にします
        confirmButton.layer.opacity = 0.5
     
    }
    
    // 確定ボタン押下時に実行される関数です
    @objc private func pushConfirmButton () {
        
        print("確定ボタンを押下しました")
        
    }
    
    // チェックボックス押下時に実行される関数です
    @objc private func pushCheckBox (_ sender: UIButton) {
        
        if checkStatus == .NONCHECKED {
            
            // 活性状態にします
            confirmButton.isEnabled = true
            // 透明を解除します
            confirmButton.layer.opacity = 1.0
            
        }
        
        
        switch sender.tag {
        
        case FeelingTypeEnum.CHECK1.rawValue:
            
            // チェック項目の色を変更します
            changeTextColor(type: .CHECK1)
            
            print("check1をクリックしました")
            
            changeCheckMark(type: .CHECK1)
            
            break
            
        case FeelingTypeEnum.CHECK2.rawValue:
            
            // チェック項目の色を変更します
            changeTextColor(type: .CHECK2)
            
            
            print("check2をクリックしました")
            
            changeCheckMark(type: .CHECK2)
            
            break
            
        case FeelingTypeEnum.CHECK3.rawValue:
            
            // チェック項目の色を変更します
            changeTextColor(type: .CHECK3)
            
            print("check3をクリックしました")
            
            changeCheckMark(type: .CHECK3)
            
            break
            
        case FeelingTypeEnum.CHECK4.rawValue:
            
            // チェック項目の色を変更します
            changeTextColor(type: .CHECK4)
            
            print("check4をクリックしました")
            
            changeCheckMark(type: .CHECK4)
            
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
            
        } else if checkStatus == type {
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
            break
            
        case .CHECK3:
            print("check3を消します")
            checkBox3.setImage(nil, for: .normal)
            break
            
        case .CHECK4:
            print("check4を消します")
            checkBox4.setImage(nil, for: .normal)
            break
            
        default:
            print("その他")
        }
        
    }
    

    // チェック項目の文字色を変更する関数です
    private func changeTextColor (type: FeelingTypeEnum) {
        
        if checkStatus == type {
            // チェック済みのチェックボックスを押下した場合
            return
        }
        
        switch checkStatus {
        
        case .CHECK1:
            item1.textColor = ColorConst.WHITE_ALPHA
            break
            
        case .CHECK2:
            item2.textColor = ColorConst.WHITE_ALPHA
            break
            
        case .CHECK3:
            item3.textColor = ColorConst.WHITE_ALPHA
            break
            
        case .CHECK4:
            item4.textColor = ColorConst.WHITE_ALPHA
            break
            
        case .NONCHECKED:
            // 全て透明にします
            item1.textColor = ColorConst.WHITE_ALPHA
            item2.textColor = ColorConst.WHITE_ALPHA
            item3.textColor = ColorConst.WHITE_ALPHA
            item4.textColor = ColorConst.WHITE_ALPHA
            break
        
        }
        
        switch type {
        
        case .CHECK1:
            item1.textColor = ColorConst.WHITE
            break
            
        case .CHECK2:
            item2.textColor = ColorConst.WHITE
            break
            
        case .CHECK3:
            item3.textColor = ColorConst.WHITE
            break
            
        case .CHECK4:
            item4.textColor = ColorConst.WHITE
            break
            
        default:
            print("何も実行しません")
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
            
        case .CHECK3:
            print("check3にマークをつけます")
            checkBox3.setImage(UIImage(systemName: "checkmark"), for: .normal)
            break
            
        case .CHECK4:
            print("check4にマークをつけます")
            checkBox4.setImage(UIImage(systemName: "checkmark"), for: .normal)
            break
            
        default:
            print("その他にマークをつけます")
            
        }
    }
   

}
