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
//    lazy var bodyView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        view.layer.cornerRadius = 4
//        view.clipsToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
        
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//        self.backgroundColor = .red
//        self.translatesAutoresizingMaskIntoConstraints = false
//        setupLayer()
//        drawShape()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // 테스트
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: 100, y: 400))
//        path.addLine(to: CGPoint(x: 250, y: 400))
//        path.close()
//        
//        path.lineWidth = 3
//        UIColor.green.setStroke()
//        
//        UIColor.black.setFill()
//        path.fill()
//        path.stroke()
        
        // 반원, 원형
//        let square = UIBezierPath(rect: CGRect(x: 100, y: 200, width: 200, height: 200))
//        
//        // addclip - 네모를 기준으로 나머지 버리는 현상
//        // square.addClip()
//        
//        let circle = UIBezierPath(ovalIn: CGRect(x: 100, y: 300, width: 200, height: 200))
//        circle.addClip()
//        
//        square.lineWidth =  4
//        circle.lineWidth = 4
//        
//        UIColor.yellow.setStroke()
//        square.stroke()
//        
//        UIColor.black.setStroke()
//        circle.stroke()
        
        // different types of UIBezierPaths
        
        let fixedWidth = 219
        
        let tip = UIBezierPath()
        tip.move(to: CGPoint(x: fixedWidth/2, y: 100))
        tip.addLine(to: CGPoint(x: (fixedWidth/2) + 8, y: 92))
        tip.addLine(to: CGPoint(x: (fixedWidth/2) + 16, y: 100))
        tip.close()
        tip.lineWidth = 3
        
        UIColor.orange.setStroke()
        tip.stroke()
        
        let newTesting = UIBezierPath(roundedRect: CGRect(x: 0, y: 100, width: fixedWidth, height: 39), cornerRadius: 4)
        newTesting.lineWidth = 1
        
        UIColor.red.setStroke()
        newTesting.stroke()
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    private func setupLayer() {
//        
//        addSubview(bodyView)
//        NSLayoutConstraint.activate([
//            bodyView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            bodyView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            bodyView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            bodyView.heightAnchor.constraint(equalToConstant: 35),
//        ])
//    }
//    
//    private func drawShape() {
//        let tipPath = UIBezierPath()
//        let halfWidth = self.frame.width/2
//        let width = bounds.width/2
//        print(halfWidth)
//        print(width)
//        
//        tipPath.move(to: CGPoint(x: 0, y: 0))
//        tipPath.addLine(to: CGPoint(x: halfWidth-10, y: 0))
//        tipPath.addLine(to: CGPoint(x: halfWidth, y: -10))
//        tipPath.addLine(to: CGPoint(x: halfWidth+10, y: 0))
//        tipPath.addLine(to: CGPoint(x: halfWidth*2, y: 0))
//        
//        let shape = CAShapeLayer()
//        shape.path = tipPath.cgPath
//        shape.lineWidth = 2
//        shape.fillColor = UIColor.blue.cgColor
//        shape.strokeColor = UIColor.green.cgColor
//        
//        bodyView.layer.addSublayer(shape)
//    }
}
