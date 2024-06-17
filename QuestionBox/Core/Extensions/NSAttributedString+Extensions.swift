//
//  NSAttributedString+Extensions.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import Foundation
import UIKit

extension NSAttributedString {
    static func setAttributedString(text: String, font: UIFont = UIFont.boldSystemFont(ofSize: 12), color: UIColor = .black, kern: Double = 0) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] =
        [.font: font,
         .foregroundColor: color,
         .kern: kern]
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    static func strikeThroughText(_ text: String, color: UIColor? = nil) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .strikethroughStyle: NSUnderlineStyle.single.rawValue,
            .strikethroughColor: color ?? UIColor.black
        ]
        return NSAttributedString(string: text, attributes: attributes)
    }
}
