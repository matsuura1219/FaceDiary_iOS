//
//  SelectFeelingViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/22.
//

import UIKit

// 感情入力画面を表示するためのViewControllerです
 
class SelectFeelingViewController: BaseViewController {
    
    // view
    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.WHITE
        label.font = FontSizeConst.X_LARGE_SIZE
        label.text = TextConst.G0060_TITLE
        label.textAlignment = .center
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private var itemLabel1: UILabel = {
    
        let label = UILabel()
        label.textColor = ColorConst.WHITE
        label.font = FontSizeConst.LARGE_SIZE
        label.text = TextConst.G0060_ITEM1
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private var itemLabel2: UILabel = {
    
        let label = UILabel()
        label.textColor = ColorConst.WHITE
        label.font = FontSizeConst.LARGE_SIZE
        label.text = TextConst.G0060_ITEM2
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private var itemLabel3: UILabel = {
    
        let label = UILabel()
        label.textColor = ColorConst.WHITE
        label.font = FontSizeConst.LARGE_SIZE
        label.text = TextConst.G0060_ITEM3
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private var itemLabel4: UILabel = {
    
        let label = UILabel()
        label.textColor = ColorConst.WHITE
        label.font = FontSizeConst.LARGE_SIZE
        label.text = TextConst.G0060_ITEM4
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var checkBox1: UIButton = {
        
        let checkBox = UIButton()
        checkBox.layer.borderWidth = 2.0
        checkBox.layer.borderColor = ColorConst.WHITE.cgColor
        checkBox.layer.cornerRadius = 3.0
        checkBox.tag  = FeelingTypeEnum.CHECK1.rawValue
        checkBox.addTarget(self, action: #selector(pushCheckBox(_:)), for: .touchUpInside)
        checkBox.setImage(nil, for: .normal)
        checkBox.tintColor = ColorConst.WHITE
        return checkBox
    }()
    
    private lazy var checkBox2: UIButton = {
        
        let checkBox = UIButton()
        checkBox.layer.borderWidth = 2.0
        checkBox.layer.borderColor = ColorConst.WHITE.cgColor
        checkBox.layer.cornerRadius = 3.0
        checkBox.tag  = FeelingTypeEnum.CHECK2.rawValue
        checkBox.addTarget(self, action: #selector(pushCheckBox(_:)), for: .touchUpInside)
        checkBox.setImage(nil, for: .normal)
        checkBox.tintColor = ColorConst.WHITE
        return checkBox
        
    }()
    
    private lazy var checkBox3: UIButton = {
        
        let checkBox = UIButton()
        checkBox.layer.borderWidth = 2.0
        checkBox.layer.borderColor = ColorConst.WHITE.cgColor
        checkBox.layer.cornerRadius = 3.0
        checkBox.tag  = FeelingTypeEnum.CHECK3.rawValue
        checkBox.addTarget(self, action: #selector(pushCheckBox(_:)), for: .touchUpInside)
        checkBox.setImage(nil, for: .normal)
        checkBox.tintColor = ColorConst.WHITE
        return checkBox
        
    }()
    
    private lazy var checkBox4: UIButton = {
        
        let checkBox = UIButton()
        checkBox.layer.borderWidth = 2.0
        checkBox.layer.borderColor = ColorConst.WHITE.cgColor
        checkBox.layer.cornerRadius = 3.0
        checkBox.tag  = FeelingTypeEnum.CHECK4.rawValue
        checkBox.addTarget(self, action: #selector(pushCheckBox(_:)), for: .touchUpInside)
        checkBox.setImage(nil, for: .normal)
        checkBox.tintColor = ColorConst.WHITE
        return checkBox
        
    }()
    
    private lazy var confirmButton: CustomButton = {
        
        let button = CustomButton(frame: UIScreen.main.bounds, bkColor: ColorConst.WHITE, borderColor: ColorConst.WHITE.cgColor, title: TextConst.G0060_YES_BUTTON_TEXT, textColor: ColorConst.MAIN_TEXT_COLOR)
        button.isEnabled = false
        button.layer.opacity = 0.5
        // イベント設定
        button.addTarget(self, action: #selector(pushConfirmButton), for: .touchUpInside)
        return button
        
    }()

    // チェックされている状態
    private var checkStatus: FeelingTypeEnum = .NONCHECKED
    
    
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
        return true
    }
    
    // 初期化を行う関数です
    private func setUp() {
        
        view.backgroundColor = ColorConst.MAIN_COLOR
        
        view.addSubview(titleLabel)
        view.addSubview(checkBox1)
        view.addSubview(itemLabel1)
        view.addSubview(checkBox2)
        view.addSubview(itemLabel2)
        view.addSubview(checkBox3)
        view.addSubview(itemLabel3)
        view.addSubview(checkBox4)
        view.addSubview(itemLabel4)
        view.addSubview(confirmButton)
        
    }
    
    // Layoutを行う関数です
    private func setLayout() {
        
        let top = getScreenHeight() * 0.15 - getNavBarHeight() - getSafeAreaTop()
        
        titleLabel.frame = CGRect(x: 0, y: top, width: getScreenWidth(), height: titleLabel.frame.height)
        
        checkBox1.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2, y: titleLabel.frame.origin.y + titleLabel.frame.height + SizeConst.XXX_LARGE_MARGIN, width: SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        
        itemLabel1.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2 + SizeConst.CHECKBOX_SIZE + 15, y: titleLabel.frame.origin.y + titleLabel.frame.height + SizeConst.XXX_LARGE_MARGIN, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2 - SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        
        checkBox2.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2, y: checkBox1.frame.origin.y + checkBox1.frame.height + SizeConst.X_LARGE_MARGIN, width: SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        
        itemLabel2.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2 + SizeConst.CHECKBOX_SIZE + 15, y: checkBox1.frame.origin.y + checkBox1.frame.height + SizeConst.X_LARGE_MARGIN, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2 - SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        
        checkBox3.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2, y: checkBox2.frame.origin.y + checkBox2.frame.height + SizeConst.X_LARGE_MARGIN, width: SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        
        itemLabel3.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2 + SizeConst.CHECKBOX_SIZE + 15, y: checkBox2.frame.origin.y + checkBox2.frame.height + SizeConst.X_LARGE_MARGIN, width: UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2 - SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        
        checkBox4.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2, y: checkBox3.frame.origin.y + checkBox3.frame.height + SizeConst.X_LARGE_MARGIN, width: SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        
        itemLabel4.frame = CGRect(x: SizeConst.SIDE_MARGIN * 2 + SizeConst.CHECKBOX_SIZE + 15, y: checkBox3.frame.origin.y + checkBox3.frame.height + SizeConst.X_LARGE_MARGIN, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2 - SizeConst.CHECKBOX_SIZE, height: SizeConst.CHECKBOX_SIZE)
        
        let yPosition = getScreenHeight() - getSafeAreaBottom() - SizeConst.BOTTOM_MARGIN - SizeConst.BUTTON_HEIGHT - SizeConst.LARGE_MARGIN -  getNavBarHeight() - getSafeAreaTop()
        
        confirmButton.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: yPosition, width: getScreenWidth() - SizeConst.SIDE_MARGIN * 2, height: SizeConst.BUTTON_HEIGHT)
    }
    
    
    // 確定ボタン押下後に実行される関数です
    @objc private func pushConfirmButton() {
        
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // チェックボックス押下時に実行される関数です
    @objc private func pushCheckBox (_ sender: UIButton) {
        
        if checkStatus == .NONCHECKED {
            // チェックボックスにチェックが付いていない場合
            // 活性状態にします
            confirmButton.isEnabled = true
            // 透明を解除します
            confirmButton.layer.opacity = 1.0
        }
        
        switch sender.tag {
        
        case FeelingTypeEnum.CHECK1.rawValue:
            
            changeTextColor(type: .CHECK1)
            changeCheckMark(type: .CHECK1)
            break
            
        case FeelingTypeEnum.CHECK2.rawValue:
            
            changeTextColor(type: .CHECK2)
            changeCheckMark(type: .CHECK2)
            break
            
        case FeelingTypeEnum.CHECK3.rawValue:
            
            changeTextColor(type: .CHECK3)
            changeCheckMark(type: .CHECK3)
            break
            
        case FeelingTypeEnum.CHECK4.rawValue:
            
            changeTextColor(type: .CHECK4)
            changeCheckMark(type: .CHECK4)
            break
            
        default:
        
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
            clearMark(type: checkStatus)
            checkMark(type: type)
            
        }
        
        // statusを変更します
        checkStatus = type
        
    }
    
    // チェックボックスのマークをクリアする関数です
    private func clearMark (type: FeelingTypeEnum) {
        
        switch type {
        
        case .CHECK1:
            checkBox1.setImage(nil, for: .normal)
            break
            
        case .CHECK2:
            checkBox2.setImage(nil, for: .normal)
            break
            
        case .CHECK3:
            checkBox3.setImage(nil, for: .normal)
            break
            
        case .CHECK4:
            checkBox4.setImage(nil, for: .normal)
            break
            
        default:
            print("その他")
        }
        
    }
    
    // チェック項目の文字色を変更する関数です
    private func changeTextColor (type: FeelingTypeEnum) {
        
        if checkStatus == type {
            return
        }
        
        itemLabel1.textColor = ColorConst.WHITE_ALPHA
        itemLabel2.textColor = ColorConst.WHITE_ALPHA
        itemLabel3.textColor = ColorConst.WHITE_ALPHA
        itemLabel4.textColor = ColorConst.WHITE_ALPHA
        
        /*
        switch checkStatus {
        
        case .CHECK1:
            itemLabel1.textColor = ColorConst.WHITE_ALPHA
            break
            
        case .CHECK2:
            itemLabel2.textColor = ColorConst.WHITE_ALPHA
            break
            
        case .CHECK3:
            itemLabel3.textColor = ColorConst.WHITE_ALPHA
            break
            
        case .CHECK4:
            itemLabel4.textColor = ColorConst.WHITE_ALPHA
            break
            
        case .NONCHECKED:
            itemLabel1.textColor = ColorConst.WHITE_ALPHA
            itemLabel2.textColor = ColorConst.WHITE_ALPHA
            itemLabel3.textColor = ColorConst.WHITE_ALPHA
            itemLabel4.textColor = ColorConst.WHITE_ALPHA
            break
        
        }
        */
        
        switch type {
        
        case .CHECK1:
            itemLabel1.textColor = ColorConst.WHITE
            break
            
        case .CHECK2:
            itemLabel2.textColor = ColorConst.WHITE
            break
            
        case .CHECK3:
            itemLabel3.textColor = ColorConst.WHITE
            break
            
        case .CHECK4:
            itemLabel4.textColor = ColorConst.WHITE
            break
            
        default:
            print("何も実行しません")
        }
        
    }
    
    // チェックボックスにマークをつける関数です
    private func checkMark (type: FeelingTypeEnum) {
        
        switch type {
        
        case .CHECK1:
            checkBox1.setImage(UIImage(systemName: "checkmark"), for: .normal)
            break
            
        case .CHECK2:
            checkBox2.setImage(UIImage(systemName: "checkmark"), for: .normal)
            break
            
        case .CHECK3:
            checkBox3.setImage(UIImage(systemName: "checkmark"), for: .normal)
            break
            
        case .CHECK4:
            checkBox4.setImage(UIImage(systemName: "checkmark"), for: .normal)
            break
            
        default:
            print("その他にマークをつけます")
            
        }
    }


}
