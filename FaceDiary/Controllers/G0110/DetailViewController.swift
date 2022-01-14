//
//  DetailViewController.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/12/31.
//

import UIKit

/**
 カレンダーの日付を押下した際に表示されるモーダル画面です
 */

class DetailViewController: UIViewController {

    // MARK: - view variables
    
    private lazy var scrollView: UIScrollView = {
       
        let view = UIScrollView()
        return view
    }()
    
    private lazy var dayLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.LARGE_SIZE
        label.text = "日付"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var dayField: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.MIDDLE_SIZE
        label.text = "2021 / 12/ 10"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var thinkLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.LARGE_SIZE
        label.text = "感想"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var thinkField: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.MIDDLE_SIZE
        label.text = "サイコーな1日でした！"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var imageLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.LARGE_SIZE
        label.text = "顔写真"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var imageView: UIImageView = {
        
        let imgView = UIImageView(image: UIImage(named: "user"))
        return imgView
        
    }()
    
    private lazy var angerLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.LARGE_SIZE
        label.text = "Anger Level"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var angerBar: ProgressBar = {
        
        let bar = ProgressBar(frame: .zero, mainColor: ColorConst.MAIN_COLOR, subColor: ColorConst.SUB_COLOR, percent: 0.60)
        return bar
        
    }()
    
    private lazy var contemptLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.LARGE_SIZE
        label.text = "Contempt Level"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var contemptBar: ProgressBar = {
        
        let bar = ProgressBar(frame: .zero, mainColor: ColorConst.MAIN_COLOR, subColor: ColorConst.SUB_COLOR, percent: 0.60)
        return bar
        
    }()
    
    private lazy var disgustLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.LARGE_SIZE
        label.text = "Disgust Level"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var disgustBar: ProgressBar = {
        
        let bar = ProgressBar(frame: .zero, mainColor: ColorConst.MAIN_COLOR, subColor: ColorConst.SUB_COLOR, percent: 0.60)
        return bar
        
    }()
    
    private lazy var fearLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.LARGE_SIZE
        label.text = "Fear Level"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var fearBar: ProgressBar = {
        
        let bar = ProgressBar(frame: .zero, mainColor: ColorConst.MAIN_COLOR, subColor: ColorConst.SUB_COLOR, percent: 0.60)
        return bar
        
    }()
    
    private lazy var happinessLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.LARGE_SIZE
        label.text = "Hapiness Level"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var happinessBar: ProgressBar = {
        
        let bar = ProgressBar(frame: .zero, mainColor: ColorConst.MAIN_COLOR, subColor: ColorConst.SUB_COLOR, percent: 0.60)
        return bar
        
    }()
    
    
    private lazy var neutralLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.LARGE_SIZE
        label.text = "Neutral Level"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var neutralBar: ProgressBar = {
        
        let bar = ProgressBar(frame: .zero, mainColor: ColorConst.MAIN_COLOR, subColor: ColorConst.SUB_COLOR, percent: 0.60)
        return bar
        
    }()
    
    private lazy var sadnessLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.LARGE_SIZE
        label.text = "Sadness Level"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var sadnessBar: ProgressBar = {
        
        let bar = ProgressBar(frame: .zero, mainColor: ColorConst.MAIN_COLOR, subColor: ColorConst.SUB_COLOR, percent: 0.60)
        return bar
        
    }()
    
    private lazy var surpriseLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = ColorConst.SUB_TEXT_COLOR
        label.font = FontSizeConst.LARGE_SIZE
        label.text = "Surprise Level"
        label.textAlignment = .left
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
        
    }()
    
    private lazy var surpriseBar: ProgressBar = {
        
        let bar = ProgressBar(frame: .zero, mainColor: ColorConst.MAIN_COLOR, subColor: ColorConst.SUB_COLOR, percent: 0.60)
        return bar
        
    }()
    
    private lazy var backButton: UIButton = {
       
        let button =  UIButton()
        button.setTitle("戻る", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(closeWindow), for: .touchUpInside)
        return button
        
    }()
    
   
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = ColorConst.WHITE
        setUp()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setLayout()
    }
    
    // MARK: Function
    
    private func setUp() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(dayLabel)
        scrollView.addSubview(dayField)
        scrollView.addSubview(thinkLabel)
        scrollView.addSubview(thinkField)
        scrollView.addSubview(imageLabel)
        scrollView.addSubview(imageView)
        scrollView.addSubview(angerLabel)
        scrollView.addSubview(angerBar)
        scrollView.addSubview(contemptLabel)
        scrollView.addSubview(contemptBar)
        scrollView.addSubview(disgustLabel)
        scrollView.addSubview(disgustBar)
        scrollView.addSubview(happinessLabel)
        scrollView.addSubview(happinessBar)
        scrollView.addSubview(fearLabel)
        scrollView.addSubview(fearBar)
        scrollView.addSubview(neutralLabel)
        scrollView.addSubview(neutralBar)
        scrollView.addSubview(sadnessLabel)
        scrollView.addSubview(sadnessBar)
        scrollView.addSubview(surpriseLabel)
        scrollView.addSubview(surpriseBar)
        scrollView.addSubview(backButton)
        
    }

    private func setLayout() {
        
        scrollView.frame = view.frame
        
        let margin: CGFloat = 30
        backButton.frame = CGRect(x: view.frame.width - margin - backButton.frame.width, y: margin, width: backButton.frame.width, height: backButton.frame.height)
        
        dayLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: 50, width: view.frame.width, height: dayLabel.frame.height)
        dayField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: dayLabel.frame.origin.y + dayLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: view.frame.width, height: dayField.frame.height)
        
        thinkLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: dayField.frame.origin.y + dayField.frame.height + SizeConst.LARGE_MARGIN, width: view.frame.width, height: thinkLabel.frame.height)
        thinkField.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: thinkLabel.frame.origin.y + thinkLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: view.frame.width, height: thinkField.frame.height)
        
        imageLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: thinkField.frame.origin.y + thinkField.frame.height + SizeConst.LARGE_MARGIN, width: view.frame.width, height: imageLabel.frame.height)
        imageView.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: imageLabel.frame.origin.y + imageLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: 200, height: 200)
        
        angerLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: imageView.frame.origin.y + imageView.frame.height + SizeConst.LARGE_MARGIN, width: view.frame.width, height: angerLabel.frame.height)
        angerBar.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: angerLabel.frame.origin.y + angerLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: view.frame.width - SizeConst.SIDE_MARGIN * 2, height: 5)
        
        contemptLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: angerBar.frame.origin.y + angerBar.frame.height + SizeConst.LARGE_MARGIN, width: view.frame.width, height: contemptLabel.frame.height)
        contemptBar.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: contemptLabel.frame.origin.y + contemptLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: view.frame.width - SizeConst.SIDE_MARGIN * 2, height: 5)
        
        disgustLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: contemptBar.frame.origin.y + contemptBar.frame.height + SizeConst.LARGE_MARGIN, width: view.frame.width, height: disgustLabel.frame.height)
        disgustBar.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: disgustLabel.frame.origin.y + disgustLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: view.frame.width - SizeConst.SIDE_MARGIN * 2, height: 5)
        
        happinessLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: disgustBar.frame.origin.y + disgustBar.frame.height + SizeConst.LARGE_MARGIN, width: view.frame.width, height: happinessLabel.frame.height)
        happinessBar.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: happinessLabel.frame.origin.y + happinessLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: view.frame.width - SizeConst.SIDE_MARGIN * 2, height: 5)
        
        fearLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: happinessBar.frame.origin.y + happinessBar.frame.height + SizeConst.LARGE_MARGIN, width: view.frame.width, height: fearLabel.frame.height)
        fearBar.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: fearLabel.frame.origin.y + fearLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: view.frame.width - SizeConst.SIDE_MARGIN * 2, height: 5)
        
        neutralLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: fearBar.frame.origin.y + fearBar.frame.height + SizeConst.LARGE_MARGIN, width: view.frame.width, height: neutralLabel.frame.height)
        neutralBar.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: neutralLabel.frame.origin.y + neutralLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: view.frame.width - SizeConst.SIDE_MARGIN * 2, height: 5)
        
        sadnessLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: neutralBar.frame.origin.y + neutralBar.frame.height + SizeConst.LARGE_MARGIN, width: view.frame.width, height: sadnessLabel.frame.height)
        sadnessBar.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: sadnessLabel.frame.origin.y + sadnessLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: view.frame.width - SizeConst.SIDE_MARGIN * 2, height: 5)
        
        surpriseLabel.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: sadnessBar.frame.origin.y + sadnessBar.frame.height + SizeConst.LARGE_MARGIN, width: view.frame.width, height: surpriseLabel.frame.height)
        surpriseBar.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: surpriseLabel.frame.origin.y + surpriseLabel.frame.height + SizeConst.MIDDIUM_MARGIN, width: view.frame.width - SizeConst.SIDE_MARGIN * 2, height: 5)
        
        // スクロール領域の設定
        scrollView.contentSize = CGSize(width: view.frame.width, height: surpriseBar.frame.origin.y + surpriseBar.frame.height + SizeConst.X_LARGE_MARGIN)
        
    }
    
    // MARK: - Event Function
    
    // 閉じるボタンを押下した際に実行される関数です
    @objc private func closeWindow() {
        self.dismiss(animated: true, completion: nil)
    }

}
