//
//  Extension.swift
//  mytodo
//
//  Created by APPLE M1 Max on 2023/09/19.
//

import Foundation
import UIKit

extension UIImageView{
    
    func urlLoad(url:URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension CGFloat{
    
    static let defalutPadding:CGFloat = 15
}


extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
