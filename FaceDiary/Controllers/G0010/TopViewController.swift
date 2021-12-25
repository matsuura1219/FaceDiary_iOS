//
//  TopViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/15.
//

import UIKit

// アプリ起動時に表示されるViewControllerです

class TopViewController: BaseViewController {
    
    // view
    private lazy var imgView: UIImageView = {
        
        let imgView = UIImageView(image: UIImage(named: "top"))
        return imgView
        
    }()
    
    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.WHITE
        label.font = FontSizeConst.XX_LARGE_SIZE
        label.text = TextConst.APP_NAME
        label.textAlignment = .center
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var subTitleLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.WHITE
        label.font = FontSizeConst.MIDDLE_SIZE
        label.text = TextConst.G0010_SUBTITLE
        label.textAlignment = .center
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初期化を行います
        setUp()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Layoutの設定を行います
        setLayout()
        
    }
    
    // ナビゲーションバーのタイトルに表示するテキストを設定する関数
    override func setNavTitle () -> String {
        return ""
    }
    
    // ナビゲーションバーを表示させるかを設定する関数です
    override func showNav () -> Bool {
        return false
    }
    
    // 戻るボタンを表示させるかを設定する関数です
    override func showBackButton() -> Bool {
        return false
    }
    
    // 初期設定を行います
    private func setUp() {
        
        view.backgroundColor = ColorConst.MAIN_COLOR
        
        view.addSubview(imgView)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        
        // For Demo App
        // 2.0s後に画面遷移をします
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(moveToNextScreen), userInfo: nil, repeats: false)
        
    }
    
    // Layoutの調整を行う関数です
    private func setLayout() {
        
        let image = UIImage(named: "top")!
        // imageViewのframeの設定を行います
        var imgWidth = image.size.width
        var imgHeight = image.size.height
        let per = imgHeight / imgWidth
        // 画面横幅の30%
        imgWidth = getScreenWidth() * 0.3
        imgHeight = imgWidth * per
        
        // 始まりのy軸を求めます
        let top = (getContentHeight() - imgHeight - titleLabel.frame.height - subTitleLabel.frame.height - SizeConst.XX_LARGE_MARGIN * 2) / 2
        
        imgView.frame = CGRect(x: getScreenWidth() * 0.35, y: top, width: imgWidth, height: imgHeight)
        
        // titleのframeの設定を行います
        titleLabel.frame = CGRect(x: 0, y: imgView.frame.origin.y + imgView.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width, height: titleLabel.frame.height)
        
        // subTitleのframeの設定を行います
        subTitleLabel.frame = CGRect(x: 0, y: titleLabel.frame.origin.y + titleLabel.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width, height: subTitleLabel.frame.height)
    }
    
    // For Demo App
    @objc func moveToNextScreen () {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
