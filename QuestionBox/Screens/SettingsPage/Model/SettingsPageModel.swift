//
//  SettingsPageModel.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 19.06.2024.
//

import Foundation
import UIKit

enum SettingsMenuType {
    case notPremiumAccount
    case premiumAccount
}

enum NotPremiumSettingsMenuItems: Int {
    case getPremiumAccount
    case restorePurchases
    case rateTheApp
    case sendFeedback

    func getName() -> String {
        switch self {
        case .getPremiumAccount:
            return "Premium Kullanıcı Ol"
        case .restorePurchases:
            return "Satın Alınanları Geri Yükle"
        case .rateTheApp:
            return "Uygulamayı Puanla"
        case .sendFeedback:
            return "Geri Bildirim Gönder"
        }
    }

    func getIcon() -> UIImage {
        switch self {
        case .getPremiumAccount:
            return UIImage().getImage(imageName: .premiumAccount)
        case .restorePurchases:
            return UIImage().getImage(imageName: .restorePurchase)
        case .rateTheApp:
            return UIImage().getImage(imageName: .rateTheApp)
        case .sendFeedback:
            return UIImage().getImage(imageName: .sendFeedback)
        }
    }
}
