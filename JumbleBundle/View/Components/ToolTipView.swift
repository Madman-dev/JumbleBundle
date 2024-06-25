//
//  ToolTip.swift
//  JumbleBundle
//
//  Created by Porori on 6/24/24.
//

import Foundation
import UIKit

class ToolTipView: UIView {
    
    // 지금 뷰를 배경으로 쓰고 - 위에 새로운 path를 그려서 값을 넣도록
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
//        self.frame = CGRect(
//            x: 100,
//            y: 100,
//            width: 219,
//            height: 45
//        )
        self.backgroundColor = .red
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
