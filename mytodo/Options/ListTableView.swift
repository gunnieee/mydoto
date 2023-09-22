//
//  ListTableView.swift
//  mytodo
//
//  Created by APPLE M1 Max on 2023/09/19.
//

import UIKit

class ListTableView: UITableView {

    init() {
        super.init(frame: CGRect.zero, style: .plain)
        self.showsVerticalScrollIndicator = true
        self.contentInset = .zero
        self.rowHeight = 42
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
