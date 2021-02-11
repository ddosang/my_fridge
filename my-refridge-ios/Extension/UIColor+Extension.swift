//
//  UIColor+Extension.swift
//  my-refridge-ios
//
//  Created by 임은지 on 2021/02/11.
//

import UIKit

extension UIColor {
    
    enum Color: String {
        case purpleFridge = "#7E67EC"
        case blueFridge = "#5B86E5"
        case greenFridge = "459F5D"
        case orangeFirdge = "F5A76B"
        case redFridge = "EB4D3C"
    }
    
    static func refridgeColor(color: Color) -> UIColor {
        return UIColor(hex: color.rawValue) ?? UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    }
    
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
