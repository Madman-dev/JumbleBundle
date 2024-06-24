//
//  Color+.swift
//  JumbleBundle
//
//  Created by Porori on 6/23/24.
//

import UIKit

//extension UIColor {
//    
//    // 무채색 컬러
//    static let g100 = UIColor(hex: "#DFE2E6")
//    static let g200 = UIColor(hex: "#AFB7C0")
//    static let g300 = UIColor(hex: "#808E9C")
//    static let g400 = UIColor(hex: "#808E9C")
//    static let g500 = UIColor(hex: "#626F7F")
//    static let g600 = UIColor(hex: "#444E5C")
//    static let g700 = UIColor(hex: "#2D3540")
//    static let g800 = UIColor(hex: "#1F242B")
//    static let g900 = UIColor(hex: "#17191C")
//    static let g1000 = UIColor(hex: "#141414")
//    
//    // 화이트 톤
//    static let w4 = UIColor(hex: "#ffffff", alpha: 0.04)
//    static let w7 = UIColor(hex: "#ffffff", alpha: 0.07)
//    static let w10 = UIColor(hex: "#ffffff", alpha: 0.1)
//    static let w30 = UIColor(hex: "#ffffff", alpha: 0.3)
//    static let w50 = UIColor(hex: "#ffffff", alpha: 0.5)
//    static let w70 = UIColor(hex: "#ffffff", alpha: 0.7)
//    static let w90 = UIColor(hex: "#ffffff", alpha: 0.9)
//    static let w100 = UIColor(hex: "#ffffff", alpha: 1.0)
//    
//    
//    // 펄 블랙
//    static let pb4 = UIColor(hex: "#141414", alpha: 0.04)
//    static let pb7 = UIColor(hex: "#141414", alpha: 0.07)
//    static let pb10 = UIColor(hex: "#141414", alpha: 0.1)
//    static let pb30 = UIColor(hex: "#141414", alpha: 0.3)
//    static let pb50 = UIColor(hex: "#141414", alpha: 0.5)
//    static let pb60 = UIColor(hex: "#141414", alpha: 0.6)
//    static let pb70 = UIColor(hex: "#141414", alpha: 0.7)
//    static let pb90 = UIColor(hex: "#141414", alpha: 0.9)
//    static let pb100 = UIColor(hex: "#141414", alpha: 1.0)
//    
//    // 블루
//    static let blu100 = UIColor(hex: "#DFE2E6")
//    static let blu200 = UIColor(hex: "#AFB7C0")
//    static let blu300 = UIColor(hex: "#808E9C")
//    static let blu400 = UIColor(hex: "#626F7F")
//    static let blu500 = UIColor(hex: "#444E5C")
//    static let blu600 = UIColor(hex: "#2D3540")
//    static let blu700 = UIColor(hex: "#1F242B")
//    static let blu800 = UIColor(hex: "#17191C")
//    static let blu900 = UIColor(hex: "#141414")
//    
//    // 제이드
//    static let jd100 = UIColor(hex: "#E6FFFA")
//    static let jd200 = UIColor(hex: "#CCFFF6")
//    static let jd300 = UIColor(hex: "#99FFEC")
//    static let jd400 = UIColor(hex: "#66FFE3")
//    static let jd500 = UIColor(hex: "#03FFD0")
//    static let jd600 = UIColor(hex: "#00E6BD")
//    static let jd700 = UIColor(hex: "#00CCA7")
//    static let jd800 = UIColor(hex: "#00997D")
//    static let jd900 = UIColor(hex: "#00997D")
//    static let jd1000 = UIColor(hex: "#004D3E")
//    
//    // 레드
//    static let re100 = UIColor(hex: "#FFE6E5")
//    static let re200 = UIColor(hex: "#FFCCCC")
//    static let re300 = UIColor(hex: "#FF999A")
//    static let re400 = UIColor(hex: "#FF6666")
//    static let re500 = UIColor(hex: "#FF0000")
//    static let re600 = UIColor(hex: "#E60001")
//    static let re700 = UIColor(hex: "#B30100")
//    static let re800 = UIColor(hex: "#800000")
//    static let re900 = UIColor(hex: "#4D0000")
//    
//    convenience init(hex: String, alpha: CGFloat = 1.0) {
//        var hexValue = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
//        
//        if hexValue.hasPrefix("#") {
//            hexValue.remove(at: hexValue.startIndex)
//        }
//        
//        var rgbValue: UInt64 = 0
//        Scanner(string: hexValue).scanHexInt64(&rgbValue)
//        
//        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
//        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
//        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
//        
//        self.init(red: red, green: green, blue: blue, alpha: alpha)
//    }
//}
