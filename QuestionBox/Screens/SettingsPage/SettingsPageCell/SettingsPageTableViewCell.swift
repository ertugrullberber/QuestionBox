//
//  SettingsPageTableViewCell.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 19.06.2024.
//

import UIKit

final class SettingsPageTableViewCell: BaseTableViewCell {

    @IBOutlet weak var settingsIcon: UIImageView!
    @IBOutlet weak var settingsName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    func setUpPremiumAccount(premiumSettingsPageModel: PremiumSettingsPageModel) {
        settingsName.text = premiumSettingsPageModel.getName()
        settingsIcon.image = premiumSettingsPageModel.getIcon()
    }

    func setUpNotPremiumAccount(notPremiumSettingsMenuItems: NotPremiumSettingsMenuItems) {
        settingsName.text = notPremiumSettingsMenuItems.getName()
        settingsIcon.image = notPremiumSettingsMenuItems.getIcon()
    }
}
