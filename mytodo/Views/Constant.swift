//
//  Constant.swift
//  mytodo
//
//  Created by APPLE M1 Max on 2023/09/19.
//

import Foundation
import UIKit

class Constant{
    
    static let viewWidth = UIScreen.main.bounds.width
    
    static let viewHeight = UIScreen.main.bounds.height
    
    static var defalutHeightPadding = viewHeight / 18
    
    static let main = MainViewConstant()
    
}

final class MainViewConstant: Constant{
    let logoImageWidth = viewWidth / 2.5
    let logoImageHeight = viewWidth / 4.5
}
