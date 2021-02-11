//
//  UIColor+Extension.swift
//  my-refridge-ios
//
//  Created by 임은지 on 2021/02/11.
//

import UIKit

extension UIColor {
    
    enum Color: String {
        case purple = "#7E67ECFF"
        case blue = "#5B86E5FF"
        case green = "459F5DFF"
        case orange = "F5A76BFf"
        case red = "EB4D3CFF"
        case gray = "#454C53FF"
    }
    
    static func refridgeColor(color: Color) -> UIColor {
        return UIColor(hex: color.rawValue) ?? UIColor(red: 0, green: 0, blue: 0, alpha: 1)
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
