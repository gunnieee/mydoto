//
//  InfoView.swift
//  mytodo
//
//  Created by APPLE M1 Max on 2023/09/22.
//

import UIKit
import SnapKit

class InfoView: UIView {
    
    var count: Int = 0
    var text: String = ""
    
    
    lazy var infoCount = {
        let label = UILabel()
        label.text = String(count)
        return label
    }()
    
    lazy var infoLabel = {
        let label = UILabel()
        label.text = text
        return label
    }()
    
    init(count: Int = 0, text: String = "") {
        super.init(frame: .zero)
        self.addSubview(infoCount)
        self.addSubview(infoLabel)
        infoCount.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
        }
        infoLabel.snp.makeConstraints {
            $0.centerX.equalTo(infoCount)
            $0.top.equalTo(infoCount.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    

