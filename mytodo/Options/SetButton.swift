//
//  SetButton.swift
//  mytodo
//
//  Created by APPLE M1 Max on 2023/09/19.
//

import UIKit

class SetButton: UIButton {

    init(title:String, fontColor: UIColor) {
        super.init(frame: CGRect.zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(fontColor, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
