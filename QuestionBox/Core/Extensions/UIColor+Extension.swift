//
//  UIColor+Extension.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import Foundation

import UIKit

extension UIColor {
    static func hexString(_ hexString: String?, defaultColor: UIColor = UIColor.white) -> UIColor {
        guard let hexString = hexString, !hexString.isEmpty else { return defaultColor }
        return UIColor(hexString: hexString)
    }

    fileprivate convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let alpha, red, green, blue: UInt64
        switch hex.count {
        case 3:
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: CGFloat(alpha) / 255)
    }
    // Isimlendirmeler icin bu siteyi kullan -> https://colors.artyclick.com/color-name-finder/
    static let primary50 = UIColor(hexString: "E7F7F8")
    static let primary100 = UIColor(hexString: "B5E7EA")
    static let primary200 = UIColor(hexString: "92DBE0")
    static let primary300 = UIColor(hexString: "60CBD2")
    static let primary400 = UIColor(hexString: "41C1C9")
    static let primary500 = UIColor(hexString: "11B1BC")
    static let primary600 = UIColor(hexString: "0FA1AB")
    static let primary700 = UIColor(hexString: "0C7E85")
    static let primary800 = UIColor(hexString: "096167")
    static let primary900 = UIColor(hexString: "074A4F")
    static let text50 = UIColor(hexString: "F0F0F0")
    static let text100 = UIColor(hexString: "D0D0D0")
    static let text200 = UIColor(hexString: "B9B9B9")
    static let text300 = UIColor(hexString: "989898")
    static let text400 = UIColor(hexString: "858585")
    static let text500 = UIColor(hexString: "666666")
    static let text600 = UIColor(hexString: "5D5D5D")
    static let text700 = UIColor(hexString: "484848")
    static let text800 = UIColor(hexString: "383838")
    static let text900 = UIColor(hexString: "2B2B2B")
    static let text950 = UIColor(hexString: "000000")
    static let info50 = UIColor(hexString: "F6F9FF")
    static let info100 = UIColor(hexString: "E2ECFF")
    static let info200 = UIColor(hexString: "D3E3FF")
    static let info300 = UIColor(hexString: "BFD7FF")
    static let info400 = UIColor(hexString: "B3CFFF")
    static let info500 = UIColor(hexString: "A0C3FF")
    static let info600 = UIColor(hexString: "92B1E8")
    static let info700 = UIColor(hexString: "728AB5")
    static let info800 = UIColor(hexString: "586B8C")
    static let info900 = UIColor(hexString: "43526B")
    static let success50 = UIColor(hexString: "F1FAF0")
    static let success100 = UIColor(hexString: "D5EFCF")
    static let success200 = UIColor(hexString: "C0E7B8")
    static let success300 = UIColor(hexString: "A3DB98")
    static let success400 = UIColor(hexString: "91D584")
    static let success500 = UIColor(hexString: "76CA65")
    static let success600 = UIColor(hexString: "6BB85C")
    static let success700 = UIColor(hexString: "548F48")
    static let success800 = UIColor(hexString: "416F38")
    static let success900 = UIColor(hexString: "32552A")
    static let warming50 = UIColor(hexString: "FFF9EE")
    static let warming100 = UIColor(hexString: "FEEECB")
    static let warming200 = UIColor(hexString: "FDE5B2")
    static let warming300 = UIColor(hexString: "FCD98E")
    static let warming400 = UIColor(hexString: "FCD279")
    static let warming500 = UIColor(hexString: "FBC757")
    static let warming600 = UIColor(hexString: "E4B54F")
    static let warming700 = UIColor(hexString: "B28D3E")
    static let warming800 = UIColor(hexString: "8A6D30")
    static let warming900 = UIColor(hexString: "695425")
    static let error50 = UIColor(hexString: "F8E6E6")
    static let error1 = UIColor(hexString: "EAB0B0")
    static let error2 = UIColor(hexString: "DF8A8A")
    static let error3 = UIColor(hexString: "D15455")
    static let error4 = UIColor(hexString: "C83334")
    static let error5 = UIColor(hexString: "BA0001")
    static let error6 = UIColor(hexString: "A90001")
    static let error7 = UIColor(hexString: "840001")
    static let error8 = UIColor(hexString: "660001")
    static let error9 = UIColor(hexString: "4E0000")
    static let fountainBlue = UIColor(hexString: "12B1BC")
    static let fountainBlueWith2Blur = UIColor(hexString: "B3E4E9")
    static let socialButtonBorderGray = UIColor(hexString: "EBF0FF")
    static let socialButtonShadowBlue = UIColor(hexString: "40BFFF")
}
