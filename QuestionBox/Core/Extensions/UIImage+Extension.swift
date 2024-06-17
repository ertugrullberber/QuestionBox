//
//  UIImage+Extension.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import UIKit

extension UIImage {
    func getImage(imageName: IconTypes) -> UIImage {
        return .init(named: imageName.rawValue) ?? UIImage()
    }
    func getSystemImage(imageName: IconTypes) -> UIImage {
        return .init(systemName: imageName.rawValue) ?? UIImage()
    }
}
