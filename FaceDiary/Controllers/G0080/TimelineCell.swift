//
//  TimelineViewCell.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/12/19.
//

import UIKit

class TimelineCell: UITableViewCell {
    
    // MARK: - view variables
    
    private let backView: UIView = {
       
        let view = UIView()
        view.layer.cornerRadius = 10.0
        view.backgroundColor = ColorConst.GRAY
        view.layer.borderWidth = 2.0
        view.layer.borderColor = ColorConst.SUB_COLOR.cgColor
        return view
        
    }()
    
    private lazy var youbiLabel: UILabel = {
        
        let text = UILabel()
        text.text = "TUE"
        text.textColor = ColorConst.MAIN_TEXT_COLOR
        text.font = FontSizeConst.LARGE_SIZE
        text.textAlignment = .center
        sizeToFit()
        return text
    }()
    
    private lazy var dayLabel: UILabel = {
       
        let text = UILabel()
        text.text = "26"
        text.textColor = ColorConst.MAIN_TEXT_COLOR
        text.font = FontSizeConst.XX_LARGE_SIZE
        text.textAlignment = .center
        sizeToFit()
        return text
        
    }()
    
    private lazy var timeLabel: UILabel = {
       
        let text = UILabel()
        text.text = "21:07"
        text.textColor = ColorConst.MAIN_TEXT_COLOR
        text.font = FontSizeConst.LARGE_SIZE
        text.textAlignment = .center
        sizeToFit()
        return text
        
    }()
    
    private lazy var thinkLabel: UILabel = {
       
        let text = UILabel()
        text.text = "充実度"
        text.textColor = ColorConst.SUB_TEXT_COLOR
        text.textAlignment = .center
        text.font = FontSizeConst.MIDDLE_SIZE
        sizeToFit()
        return text
        
    }()
    
    private lazy var thinkLevel: UILabel = {
        
        let text = UILabel()
        text.text = "Lv.4"
        text.textColor = ColorConst.SUB_TEXT_COLOR
        text.textAlignment = .center
        text.layer.borderColor = ColorConst.BLACK.cgColor
        text.font = FontSizeConst.X_LARGE_SIZE
        text.backgroundColor = ColorConst.WHITE
        text.layer.borderWidth = 2.0
        sizeToFit()
        return text
        
    }()
    
    private lazy var imgLabel: UILabel = {
       
        let text = UILabel()
        text.text = "顔画像"
        text.textColor = ColorConst.SUB_TEXT_COLOR
        text.font = FontSizeConst.MIDDLE_SIZE
        text.textAlignment = .center
        return text
        
    }()
    
    private lazy var imgView: UIImageView = {
       
        let image = UIImage(named: "user")
        let imgView = UIImageView(image: image)
        imageView?.layer.borderColor = ColorConst.BLACK.cgColor
        imgView.backgroundColor = ColorConst.WHITE
        imgView.layer.borderWidth = 3.0
        return imgView
        
    }()
    
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backView.addSubview(youbiLabel)
        backView.addSubview(dayLabel)
        backView.addSubview(timeLabel)
        backView.addSubview(thinkLabel)
        backView.addSubview(thinkLevel)
        backView.addSubview(imgLabel)
        backView.addSubview(imgView)
        contentView.addSubview(backView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backView.frame = CGRect(x: SizeConst.SIDE_MARGIN, y: 0, width: frame.width - SizeConst.SIDE_MARGIN * 2, height: SizeConst.TIMELINE_HEIGHT)
        
        youbiLabel.frame = CGRect(x: 0, y: 0, width: backView.frame.width * 0.2, height: SizeConst.TIMELINE_HEIGHT / 3)
        dayLabel.frame = CGRect(x: 0, y: youbiLabel.frame.origin.y + youbiLabel.frame.height , width: backView.frame.width * 0.2, height: SizeConst.TIMELINE_HEIGHT / 3)
        timeLabel.frame = CGRect(x: 0, y: dayLabel.frame.origin.y + dayLabel.frame.height, width: backView.frame.width * 0.2, height: SizeConst.TIMELINE_HEIGHT / 3)
        
        thinkLabel.frame = CGRect(x: backView.frame.width * 0.3, y: 0, width: backView.frame.width * 0.35, height: SizeConst.TIMELINE_HEIGHT / 3)
        thinkLevel.frame = CGRect(x: backView.frame.width * 0.35, y: thinkLabel.frame.origin.y + thinkLabel.frame.height, width: backView.frame.width * 0.25, height: 80)
        
        imgLabel.frame = CGRect(x: backView.frame.width * 0.65, y: 0, width: backView.frame.width * 0.35, height: SizeConst.TIMELINE_HEIGHT / 3)
        imgView.frame = CGRect(x: backView.frame.width * 0.7, y: imgLabel.frame.origin.y + imgLabel.frame.height, width: backView.frame.width * 0.25, height: 80)

    }
    
    
}
