//
//  ProgressBar.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/12/31.
//

import UIKit

/**
 進捗バーを表示するクラスです
 */
class ProgressBar: UIView {
    
    // MARK: - variables
    
    private var mainColor: UIColor?
    private var subColor: UIColor?
    // private var mFrame: CGRect?
    private var percent: Double = 0.0

    // MARK: - view variables
    
    private lazy var barView: UIView = {
        
        let view = UIView()
        view.backgroundColor = mainColor
        return view
        
    }()
    
    private lazy var baseView: UIView = {
       
        let view = UIView()
        view.backgroundColor = subColor
        return view
        
    }()
   

    // MARK: - Life Cycle
    
    init(frame: CGRect, mainColor: UIColor, subColor: UIColor, percent: Double) {
        super.init(frame: frame)
        
        self.mainColor = mainColor
        self.subColor = subColor
        // self.mFrame = frame
        self.percent = percent
        
        setUp()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
    }
    
    // MARK: - Function
    
    private func setUp() {
    
        addSubview(baseView)
        baseView.addSubview(barView)
        
    }
    
    private func setLayout() {
        
        baseView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        barView.frame = CGRect(x: 0, y: 0, width: baseView.frame.width * percent, height: baseView.frame.height)
        
    }
}
