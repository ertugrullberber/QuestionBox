//
//  SettingsPageViewModel.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import Foundation

class SettingsPageViewModel: BaseViewModel {
    var numberOfItems = 0
    var menuType: SettingsMenuType = AuthManager.shared.menuType
    var menuItems: [NotPremiumSettingsMenuItems]? {
        didSet {
            numberOfItems = menuItems?.count ?? 0
        }
    }

    var premiumSettingsPageModel: [PremiumSettingsPageModel]? {
        didSet {
            numberOfItems = premiumSettingsPageModel?.count ?? 0
        }
    }

    func setData() {
        switch menuType {
        case .notPremiumAccount:
            menuItems = [NotPremiumSettingsMenuItems.getPremiumAccount, NotPremiumSettingsMenuItems.restorePurchases, NotPremiumSettingsMenuItems.rateTheApp, NotPremiumSettingsMenuItems.sendFeedback]
        case .premiumAccount:
            premiumSettingsPageModel = [PremiumSettingsPageModel.premium]
        }
    }
}
