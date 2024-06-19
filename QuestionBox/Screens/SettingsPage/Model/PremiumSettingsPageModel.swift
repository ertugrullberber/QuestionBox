//
//  PremiumSettingsPageModel.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 19.06.2024.
//

import Foundation
import UIKit


enum PremiumSettingsPageModel: Int {
    case premium

    func getName() -> String {
        switch self {
        case .premium:
            return "Giriş Yap veya Kayıt Ol"
        }
    }

    func getIcon() -> UIImage {
        switch self {
        case .premium:
            return UIImage().getImage(imageName: "")
        }
    }
}
