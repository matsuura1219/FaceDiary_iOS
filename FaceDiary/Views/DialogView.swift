//
//  DialogView.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/12/26.
//

import Foundation
import UIKit

// ダイアログ画面です

class DialogView: UIView {
    
    // ダイアログメッセージ
    private var message: String = ""
    // yesボタンのテキスト
    private var yesText: String = ""
    // noボタンのテキスト
    private var noText: String = ""
    // delegate
    private weak var delegate: ButtonTapped?
    
    private lazy var overlay: UIView = {
       
        let view = UIView()
        view.backgroundColor = ColorConst.WHITE_ALPHA
        return view
        
    }()
    
    private lazy var dialog: UIView = {
        
        let view = UIView()
        view.backgroundColor = ColorConst.MAIN_COLOR
        view.layer.cornerRadius = 15.0
        return view
        
    }()
    
    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.WHITE
        label.font = FontSizeConst.LARGE_SIZE
        label.text = message
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0;
        // frame調整用
        label.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - (SizeConst.MIDDIUM_MARGIN + SizeConst.MIDDIUM_MARGIN) * 2, height: label.frame.height)
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var yesButton: UIButton = {
        
        let button = CustomButton(frame: .zero, bkColor: ColorConst.WHITE, borderColor: ColorConst.MAIN_COLOR.cgColor, title: yesText, textColor: ColorConst.MAIN_TEXT_COLOR)
        button.tag = ClickTypeEnum.YES_BUTTON.rawValue
        button.addTarget(self, action: #selector(pushButton(_ :)), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var noButton: UIButton = {
        
        let button = CustomButton(frame: .zero, bkColor: ColorConst.MAIN_COLOR, borderColor: ColorConst.WHITE.cgColor, title: noText, textColor: ColorConst.WHITE)
        button.tag = ClickTypeEnum.NO_BUTTON.rawValue
        button.addTarget(self, action: #selector(pushButton(_ :)), for: .touchUpInside)
        return button
        
    }()
    
    init(frame: CGRect, message: String, yes: String, no: String, delegate: ButtonTapped) {
        super.init(frame: frame)
        
        self.delegate = delegate
        self.message = message
        self.yesText = yes
        self.noText = no
        
        // 初期化を行います
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Layoutを設定します
        setLayout()
    }
    
    
    // 初期化を行う関数です
    private func setUp() {
        
        addSubview(overlay)
        overlay.addSubview(dialog)
        dialog.addSubview(titleLabel)
        dialog.addSubview(yesButton)
        dialog.addSubview(noButton)
        
    }
    
    
    // Layoutを行う関数です
    private func setLayout() {
        
        overlay.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

        let popUpWidth = UIScreen.main.bounds.width - SizeConst.SIDE_MARGIN * 2
        let popUpHeight = titleLabel.frame.height + SizeConst.BUTTON_HEIGHT + SizeConst.LARGE_MARGIN * 3
        
        dialog.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: (UIScreen.main.bounds.height - popUpHeight) / 2, width: overlay.frame.width - SizeConst.SIDE_MARGIN * 2, height: popUpHeight)
        
        titleLabel.frame = CGRect(x: SizeConst.MIDDIUM_MARGIN, y: SizeConst.LARGE_MARGIN, width: dialog.frame.width - SizeConst.MIDDIUM_MARGIN * 2, height: titleLabel.frame.height)
        
        let buttonWidth = (popUpWidth - SizeConst.MIDDIUM_MARGIN * 3) / 2
        
        yesButton.frame = CGRect(x: SizeConst.MIDDIUM_MARGIN, y: titleLabel.frame.origin.y + titleLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: buttonWidth, height: SizeConst.BUTTON_HEIGHT)
        
        noButton.frame = CGRect(x: yesButton.frame.origin.x + buttonWidth + SizeConst.MIDDIUM_MARGIN, y: titleLabel.frame.origin.y + titleLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: buttonWidth, height: SizeConst.BUTTON_HEIGHT)
        
    }
    
    // ボタン押下時に実行される関数です
    @objc private func pushButton(_ sender: UIButton) {
        
        switch sender.tag {
        
        case ClickTypeEnum.YES_BUTTON.rawValue:
            delegate?.tappedButton(type: ClickTypeEnum.YES_BUTTON)
            
        case ClickTypeEnum.NO_BUTTON.rawValue:
            delegate?.tappedButton(type: ClickTypeEnum.NO_BUTTON)
            
        default:
            print("ERROR")
            
        }
    }
    
   
    
}
