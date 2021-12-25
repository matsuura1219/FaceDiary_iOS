//
//  RegisterViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/16.
//

import UIKit

/**
今日の顔画像と感情を登録するかを確認するViewControllerです
*/

class RegisterViewController: BaseViewController {
    
    // view
    private lazy var titleLable: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.WHITE
        label.font = FontSizeConst.X_LARGE_SIZE
        label.text = TextConst.G0050_TITLE
        label.textAlignment = .center
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var imgView: UIImageView = {
        
        let imgView = UIImageView(image: UIImage(named: "register"))
        return imgView
        
    }()
    
    private lazy var yesButton: CustomButton = {
        
        let button = CustomButton(frame: .zero, bkColor: ColorConst.WHITE, borderColor: ColorConst.MAIN_COLOR.cgColor, title: "登録", textColor: ColorConst.MAIN_TEXT_COLOR)
        button.tag = ClickTypeEnum.YES_BUTTON.rawValue
        button.addTarget(self, action: #selector(pushButton(_ :)), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var noButton: CustomButton = {
       
        let button = CustomButton(frame: .zero, bkColor: ColorConst.MAIN_COLOR, borderColor: ColorConst.WHITE.cgColor, title: "後で", textColor: ColorConst.WHITE)
        button.tag = ClickTypeEnum.NO_BUTTON.rawValue
        button.addTarget(self, action: #selector(pushButton(_ :)), for: .touchUpInside)
        return button
        
    }()
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初期化を行います
        setUp()
        
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Laypoutの設定を行います
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
        
        view.addSubview(titleLable)
        view.addSubview(imgView)
        view.addSubview(yesButton)
        view.addSubview(noButton)
        
    }
    
    // Layoutの設定を行う関数です
    private func setLayout() {
        
        // 画像のサイズを設定します
        let image = UIImage(named: "register")!
        var imgWidth = image.size.width
        var imgHeight = image.size.height
        let per = imgHeight / imgWidth
        
        imgWidth = getScreenWidth() * 0.4
        imgHeight = imgWidth * per
       
        let top = getScreenHeight() * 0.15 - getNavBarHeight() - getSafeAreaTop()
        
        // frameの設定をします
        titleLable.frame = CGRect(x: 0, y: top, width: getScreenWidth(), height: titleLable.frame.height)
        imgView.frame = CGRect(x: getScreenWidth() * 0.3, y: (getScreenHeight() - imgHeight) / 2  - getNavBarHeight() - getSafeAreaTop(), width: imgWidth, height: imgHeight)
        
        let buttonWidth = (getScreenWidth() - SizeConst.SIDE_MARGIN * 3) / 2
        
        let yPosition = getScreenHeight() - getSafeAreaBottom() - SizeConst.BOTTOM_MARGIN - SizeConst.BUTTON_HEIGHT - SizeConst.LARGE_MARGIN -  getNavBarHeight() - getSafeAreaTop()
        
        noButton.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: yPosition, width: buttonWidth, height: SizeConst.BUTTON_HEIGHT)
        yesButton.frame = CGRect(x: buttonWidth + SizeConst.SIDE_MARGIN * 2, y: yPosition, width: buttonWidth, height: SizeConst.BUTTON_HEIGHT)
        
    }
    
    
    // ボタンクリック時に実行される関数です
    @objc private func pushButton(_ sender: UIButton) {
        
        if sender.tag == ClickTypeEnum.YES_BUTTON.rawValue {
            // 確定ボタン押下時
            let vc = SelectFeelingViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        } else if sender.tag == ClickTypeEnum.NO_BUTTON.rawValue {
            // 後でボタン押下時
            let vc = HomeViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
}
