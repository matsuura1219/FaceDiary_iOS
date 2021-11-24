//
//  TopView.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/15.
//

import UIKit


/**
 アプリ起動時に表示されるViewクラスです
 */

class TopView: UIView {
    
    // 変数
    // image
    private var image: UIImage
    // imageView
    private var imageView: UIImageView
    // title
    private var title: UILabel
    // subtitle
    private var subTitle: UILabel
    
    
    // イニシアライザ
    override init (frame: CGRect) {
        
        // インスタンス化
        image = UIImage(named: "top")!
        imageView = UIImageView()
        title = UILabel()
        subTitle = UILabel()
        
        super.init(frame: frame)
        
    }

    
    // init(frame:)をオーバーライドするため、実装必要あり
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        
        // imageViewの設定を行います
        setImageView()
        
        // imageViewのframeの設定を行います
        var imgWidth = image.size.width
        var imgHeight = image.size.height
        let per = imgHeight / imgWidth
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        // 画面横幅の30%
        imgWidth = screenWidth * 0.3
        imgHeight = imgWidth * per
        // imageViewの開始位置（y軸）
        let topMargin = (screenHeight - imgHeight - title.frame.height - subTitle.frame.height - SizeConst.XX_LARGE_MARGIN * 2) / 2
        imageView.frame = CGRect(x: screenWidth * 0.35, y: topMargin, width: imgWidth, height: imgHeight)
        
        // titleの設定を行います
        setTitle()
        // titleのframeの設定を行います
        title.frame = CGRect(x: 0, y: topMargin + imageView.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width, height: title.frame.height)
        
        // subTitleの設定を行います
        setSubTitle()
        // subTitleのframeの設定を行います
        subTitle.frame = CGRect(x: 0, y: title.frame.origin.y + title.frame.height + SizeConst.XX_LARGE_MARGIN, width: UIScreen.main.bounds.width, height: subTitle.frame.height)
        
    }
    
    // imageViewの設定を行う関数です
    func setImageView () {
        // 画像の設定
        imageView = UIImageView(image: image)
        // viewに追加
        self.addSubview(imageView)
    }
    
    // titleの設定を行う関数です
    func setTitle () {
        
        // 文字色
        title.textColor = ColorConst.WHITE
        // フォントサイズ
        title.font = FontSizeConst.XX_LARGE_SIZE
        // テキスト
        title.text = TextConst.APP_NAME
        // 中央寄せ
        title.textAlignment = .center
        // 最大行数を指定(0は無制限)
        title.numberOfLines = 0;
        // frameを文字に揃える
        title.sizeToFit()
        // viewに追加
        self.addSubview(title)
        
    }
    
    // subTitleの設定を行う関数です
    func setSubTitle () {
        // 文字色
        subTitle.textColor = ColorConst.WHITE
        // フォントサイズ
        subTitle.font = FontSizeConst.MIDDLE_SIZE
        // テキスト
        subTitle.text = TextConst.SUBTITLE
        // 中央寄せ
        subTitle.textAlignment = .center
        // 最大行数を指定(0は無制限)
        subTitle.numberOfLines = 0;
        // frameを文字に揃える
        subTitle.sizeToFit()
        // viewに追加
        self.addSubview(subTitle)
        
    }
    
}
