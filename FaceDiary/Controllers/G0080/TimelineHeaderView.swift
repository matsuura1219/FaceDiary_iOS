//
//  TimelineHeaderView.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/12/23.
//

import UIKit

class TimelineHeaderView: UITableViewHeaderFooterView {
    
    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.backgroundColor = ColorConst.SUB_COLOR
        label.font = FontSizeConst.MIDDLE_SIZE
        return label
    
    }()
    
    func setUp (text: String) {

        titleLabel.text = "fffff"
        
    }
    
    
}
